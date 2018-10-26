/**
 *
 */
package com.smiles.facades.order.impl;

import de.hybris.platform.catalog.CatalogVersionService;
import de.hybris.platform.catalog.model.CatalogVersionModel;
import de.hybris.platform.commercefacades.order.data.OrderData;
import de.hybris.platform.commercefacades.product.ProductOption;
import de.hybris.platform.commercefacades.product.data.BaseOptionData;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commercefacades.product.data.VariantOptionData;
import de.hybris.platform.converters.ConfigurablePopulator;
import de.hybris.platform.core.model.order.OrderModel;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.ProductService;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import de.hybris.platform.variants.model.VariantProductModel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.smiles.facades.order.DashboardOrderFacade;
import com.smiles.service.order.DashboardOrderService;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardOrderFacadeImpl implements DashboardOrderFacade
{
	private static final Logger LOG = Logger.getLogger(DashboardOrderFacadeImpl.class);
	private static final String CATALOGID = "distBRStoreProductCatalog";
	private DashboardOrderService dashboardOrderService;
	private Converter<OrderModel, OrderData> orderConverter;
	private ProductService productService;
	private CatalogVersionService catalogVersionService;
	private Converter<ProductModel, ProductData> productConverter;
	private ConfigurablePopulator<ProductModel, ProductData, ProductOption> productConfiguredPopulator;


	@Override
	public List<OrderData> getDistributorOrders(final String currentUserId, final Date fromDate, final Date toDate)
	{
		final List<OrderModel> result = dashboardOrderService.getDistributorOrders(currentUserId, fromDate, toDate);
		final List<OrderData> orderHistoryList = new ArrayList<OrderData>();
		for (final OrderModel orderModel : result)
		{
			if (orderModel != null)
			{
				final OrderData cpOrderData = getOrderConverter().convert(orderModel);
				orderHistoryList.add(cpOrderData);
			}
		}
		Collections.reverse(orderHistoryList);
		return orderHistoryList;
	}

	@Override
	public List<OrderData> getDistributorAllOrders(final String currentUserId)
	{
		final List<OrderModel> result = dashboardOrderService.getDistributorAllOrders(currentUserId);
		final List<OrderData> orderHistoryList = new ArrayList<OrderData>();
		for (final OrderModel orderModel : result)
		{
			if (orderModel != null)
			{
				final OrderData cpOrderData = getOrderConverter().convert(orderModel);
				orderHistoryList.add(cpOrderData);
			}
		}
		Collections.reverse(orderHistoryList);
		return orderHistoryList;
	}

	@Override
	public List<OrderData> getOrderDetails(final String orderNumber, final String orderStatus, final String customerId,
			final Date fromDate, final Date toDate)
	{
		final List<OrderModel> result = dashboardOrderService.getOrderDetails(orderNumber, orderStatus, customerId, fromDate,
				toDate);
		final List<OrderData> orderHistoryList = new ArrayList<OrderData>();
		for (final OrderModel orderModel : result)
		{
			if (orderModel != null)
			{
				final OrderData cpOrderData = getOrderConverter().convert(orderModel);
				orderHistoryList.add(cpOrderData);
			}
		}
		Collections.reverse(orderHistoryList);
		return orderHistoryList;
	}


	@Override
	public VariantOptionData getVariantOptionData(final String productCode)
	{
		catalogVersionService.setSessionCatalogVersion(CATALOGID, "Staged");
		final CatalogVersionModel catalogVersion = catalogVersionService.getSessionCatalogVersionForCatalog(CATALOGID);
		VariantOptionData variantOptionData = null;
		final List<ProductOption> options = Arrays.asList(ProductOption.BASIC, ProductOption.PRICE, ProductOption.VARIANT_FULL);

		try
		{
			final ProductModel productModel = productService.getProductForCode(catalogVersion, productCode);
			final ProductData productData = getProductConverter().convert(productModel);

			getProductConfiguredPopulator().populate(productModel, productData, options);

			if (productData.getBaseOptions() != null)
			{
				for (final BaseOptionData productBaseOption : productData.getBaseOptions())
				{
					final VariantOptionData productOption = productBaseOption.getSelected();
					if (productOption != null)
					{
						variantOptionData = productOption;
						break;
					}

				}
			}

		}
		catch (final Exception ex)
		{
			LOG.info("Product Not found" + productCode);
		}
		return variantOptionData;
	}

	@Override
	public Collection<VariantProductModel> getAllVariantsOfProduct(final String productCode)
	{
		catalogVersionService.setSessionCatalogVersion(CATALOGID, "Staged");
		final CatalogVersionModel catalogVersion = catalogVersionService.getSessionCatalogVersionForCatalog(CATALOGID);
		Collection<VariantProductModel> variants = null;
		try
		{
			final ProductModel baseProduct = productService.getProductForCode(catalogVersion, productCode);
			variants = baseProduct.getVariants();
		}
		catch (final Exception ex)
		{
			LOG.info("Product Not found" + productCode);
		}
		return variants;
	}

	/**
	 * @return the dashboardOrderService
	 */
	public DashboardOrderService getDashboardOrderService()
	{
		return dashboardOrderService;
	}



	/**
	 * @param dashboardOrderService
	 *           the dashboardOrderService to set
	 */
	public void setDashboardOrderService(final DashboardOrderService dashboardOrderService)
	{
		this.dashboardOrderService = dashboardOrderService;
	}



	/**
	 * @return the orderConverter
	 */
	public Converter<OrderModel, OrderData> getOrderConverter()
	{
		return orderConverter;
	}



	/**
	 * @param orderConverter
	 *           the orderConverter to set
	 */
	public void setOrderConverter(final Converter<OrderModel, OrderData> orderConverter)
	{
		this.orderConverter = orderConverter;
	}

	public ProductService getProductService()
	{
		return productService;
	}

	public void setProductService(final ProductService productService)
	{
		this.productService = productService;
	}

	public CatalogVersionService getCatalogVersionService()
	{
		return catalogVersionService;
	}

	public void setCatalogVersionService(final CatalogVersionService catalogVersionService)
	{
		this.catalogVersionService = catalogVersionService;
	}

	public Converter<ProductModel, ProductData> getProductConverter()
	{
		return productConverter;
	}

	public void setProductConverter(final Converter<ProductModel, ProductData> productConverter)
	{
		this.productConverter = productConverter;
	}

	public ConfigurablePopulator<ProductModel, ProductData, ProductOption> getProductConfiguredPopulator()
	{
		return productConfiguredPopulator;
	}

	public void setProductConfiguredPopulator(
			final ConfigurablePopulator<ProductModel, ProductData, ProductOption> productConfiguredPopulator)
	{
		this.productConfiguredPopulator = productConfiguredPopulator;
	}

}
