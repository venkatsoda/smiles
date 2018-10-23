/**
 *
 */
package com.smiles.controllers.pages;

import de.hybris.platform.acceleratorservices.urlresolver.SiteBaseUrlResolutionService;
import de.hybris.platform.acceleratorstorefrontcommons.breadcrumb.ResourceBreadcrumbBuilder;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.ThirdPartyConstants;
import de.hybris.platform.acceleratorstorefrontcommons.controllers.pages.AbstractSearchPageController;
import de.hybris.platform.catalog.CatalogVersionService;
import de.hybris.platform.cms2.exceptions.CMSItemNotFoundException;
import de.hybris.platform.cms2.servicelayer.services.CMSSiteService;
import de.hybris.platform.commercefacades.customer.CustomerFacade;
import de.hybris.platform.commercefacades.order.OrderFacade;
import de.hybris.platform.commercefacades.order.data.OrderData;
import de.hybris.platform.commerceservices.customer.CustomerAccountService;
import de.hybris.platform.product.ProductService;
import de.hybris.platform.servicelayer.i18n.I18NService;
import de.hybris.platform.servicelayer.media.MediaService;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.platform.store.services.BaseStoreService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smiles.controllers.ControllerConstants;
import com.smiles.facades.order.DashboardOrderFacade;




@Controller
@RequestMapping("/DashBoard")
public class DashboardPageController extends AbstractSearchPageController
{
	private static final String ORDER_HISTORY_CMS_PAGE = "orders";

	private static final String BREADCRUMBS_ATTR = "breadcrumbs";




	@Resource
	private ModelService modelService;


	@Resource(name = "accountBreadcrumbBuilder")
	private ResourceBreadcrumbBuilder accountBreadcrumbBuilder;

	@Resource(name = "orderFacade")
	private OrderFacade orderFacade;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "customerFacade")
	private CustomerFacade customerFacade;



	@Resource(name = "i18nService")
	private I18NService i18nService;

	@Resource(name = "messageSource")
	private MessageSource messageSource;

	@Resource(name = "siteBaseUrlResolutionService")
	private SiteBaseUrlResolutionService siteBaseUrlResolutionService;

	@Resource(name = "cmsSiteService")
	private CMSSiteService cmsSiteService;

	@Resource(name = "customerAccountService")
	private CustomerAccountService customerAccountService;

	@Resource(name = "baseStoreService")
	private BaseStoreService baseStoreService;

	@Resource(name = "catalogVersionService")
	private CatalogVersionService catalogVersionService;

	@Resource
	private MediaService mediaService;

	@Resource(name = "dashboardOrderFacade")
	private DashboardOrderFacade dashboardOrderFacade;

	@RequestMapping(value = "/orders/manage-orders", method = RequestMethod.GET)
	public String orders(final Model model) throws CMSItemNotFoundException
	{

		final List<OrderData> orderHistoryList = dashboardOrderFacade
				.getDistributorAllOrders(userService.getCurrentUser().getUid());
		// populate the  user name as store name
		//	model.addAttribute("orderHistoryList", getRecentOrders(populateModelStoreName(orderHistoryList)));
		model.addAttribute("orderHistoryList", orderHistoryList);
		//model.addAttribute("dashboardOrderForm", new DashboardOrderForm());
		storeCmsPageInModel(model, getContentPageForLabelOrId(ORDER_HISTORY_CMS_PAGE));
		setUpMetaDataForContentPage(model, getContentPageForLabelOrId(ORDER_HISTORY_CMS_PAGE));
		model.addAttribute(BREADCRUMBS_ATTR, accountBreadcrumbBuilder.getBreadcrumbs("text.account.orderHistory"));
		model.addAttribute(ThirdPartyConstants.SeoRobots.META_ROBOTS, ThirdPartyConstants.SeoRobots.NOINDEX_NOFOLLOW);
		return ControllerConstants.Views.Pages.DashBoard.distributorAllOrdersPage;
	}

}