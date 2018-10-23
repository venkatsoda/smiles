/**
 *
 */
package com.smiles.facades.order;

import de.hybris.platform.commercefacades.order.data.OrderData;
import de.hybris.platform.commercefacades.product.data.VariantOptionData;
import de.hybris.platform.variants.model.VariantProductModel;

import java.util.Collection;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public interface DashboardOrderFacade
{
	public List<OrderData> getDistributorOrders(String currentUserId, Date fromDate, Date toDate);

	public List<OrderData> getDistributorAllOrders(String currentUserId);

	public List<OrderData> getOrderDetails(final String orderNumber, String orderStatus, final String customerId,
			final Date fromDate, final Date toDate);

	public VariantOptionData getVariantOptionData(String productCode);

	public Collection<VariantProductModel> getAllVariantsOfProduct(String productCode);

}
