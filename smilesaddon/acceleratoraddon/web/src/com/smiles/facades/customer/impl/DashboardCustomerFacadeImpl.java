/**
 *
 */
package com.smiles.facades.customer.impl;

import de.hybris.platform.acceleratorservices.urlresolver.SiteBaseUrlResolutionService;
import de.hybris.platform.b2b.model.B2BCustomerModel;
import de.hybris.platform.cms2.servicelayer.services.CMSSiteService;
import de.hybris.platform.commercefacades.order.OrderFacade;
import de.hybris.platform.commerceservices.customer.CustomerAccountService;
import de.hybris.platform.servicelayer.i18n.CommonI18NService;
import de.hybris.platform.servicelayer.i18n.I18NService;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.session.SessionService;
import de.hybris.platform.servicelayer.user.PasswordEncoderConstants;
import de.hybris.platform.servicelayer.user.UserService;
import de.hybris.platform.store.services.BaseStoreService;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.util.Assert;

import com.smiles.facades.customer.DashboardCustomerFacade;
import com.smiles.service.customer.DashboardCustomerService;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardCustomerFacadeImpl implements DashboardCustomerFacade
{
	private DashboardCustomerService dashboardCustomerService;
	private static final Logger LOG = Logger.getLogger(DashboardCustomerFacadeImpl.class);


	@Resource(name = "modelService")
	private ModelService modelService;

	@Resource(name = "commonI18NService")
	private CommonI18NService commonI18NService;

	@Autowired
	private UserService userService;

	private String passwordEncoding = PasswordEncoderConstants.DEFAULT_ENCODING;

	@Resource(name = "sessionService")
	private SessionService sessionService;

	@Resource(name = "i18nService")
	private I18NService i18nService;

	@Resource(name = "messageSource")
	private MessageSource messageSource;

	@Resource(name = "customerAccountService")
	private CustomerAccountService customerAccountService;

	@Resource(name = "baseStoreService")
	private BaseStoreService baseStoreService;

	@Resource(name = "siteBaseUrlResolutionService")
	private SiteBaseUrlResolutionService siteBaseUrlResolutionService;

	@Resource(name = "cmsSiteService")
	private CMSSiteService cmsSiteService;



	@Resource(name = "orderFacade")
	private OrderFacade orderFacade;

	@Override
	public List<B2BCustomerModel> getAllCustomersForDistributor(final String currentUserId)
	{
		return dashboardCustomerService.getAllCustomersForDistributor(currentUserId);
	}

	/**
	 * @return the dashboardCustomerService
	 */
	public DashboardCustomerService getDashboardCustomerService()
	{
		return dashboardCustomerService;
	}

	@Override
	public B2BCustomerModel getCustomerforPK(final String PK)
	{
		return dashboardCustomerService.getCustomerforPK(PK);
	}

	/**
	 * @param dashboardCustomerService
	 *           the dashboardCustomerService to set
	 */
	public void setDashboardCustomerService(final DashboardCustomerService dashboardCustomerService)
	{
		this.dashboardCustomerService = dashboardCustomerService;
	}




	/**
	 * @return the modelService
	 */
	public ModelService getModelService()
	{
		return modelService;
	}

	/**
	 * @param modelService
	 *           the modelService to set
	 */


	public void setModelService(final ModelService modelService)
	{
		this.modelService = modelService;
	}

	/**
	 * @return the commonI18NService
	 */
	public CommonI18NService getCommonI18NService()
	{
		return commonI18NService;
	}

	/**
	 * @param commonI18NService
	 *           the commonI18NService to s
	 */
	public void setCommonI18NService(final CommonI18NService commonI18NService)
	{
		this.commonI18NService = commonI18NService;
	}



	/**
	 * @return the passwordEncoding
	 */
	public String getPasswordEncoding()
	{
		return passwordEncoding;
	}

	/**
	 * @param passwordEncoding
	 *           the passwordEncoding to set
	 */
	public void setPasswordEncoding(final String passwordEncoding)
	{
		Assert.hasText(passwordEncoding);
		this.passwordEncoding = passwordEncoding;
	}

	@Override
	public B2BCustomerModel getB2BCustomerByUid(final String uid)
	{
		return dashboardCustomerService.getB2BCustomerByUid(uid);
	}

	/**
	 * @return the sessionService
	 */
	public SessionService getSessionService()
	{
		return sessionService;
	}

	/**
	 * @param sessionService
	 *           the sessionService to set
	 */
	public void setSessionService(final SessionService sessionService)
	{
		this.sessionService = sessionService;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.facades.customer.DashboardCustomerFacade#getAllDistributors()
	 */
	@Override
	public List<B2BCustomerModel> getAllDistributors()
	{
		// YTODO Auto-generated method stub
		return dashboardCustomerService.getAllDistributors();
	}



	/*
	 * (non-Javadoc)
	 *
	 * @see com.colpal.distbraddon.facades.customer.DashboardCustomerFacade#SearchCustomers(java.lang.String,
	 * java.lang.String, boolean)
	 */
	@Override
	public List<B2BCustomerModel> SearchCustomers(final String currentUserId, final String custName, final String custUid,
			final boolean isServiceable)
	{
		return dashboardCustomerService.SearchCustomers(currentUserId, custName, custUid, isServiceable);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.colpal.distbraddon.facades.customer.DashboardCustomerFacade#getAllNonServicebleCustomersForDistributor(java.
	 * lang.String)
	 */
	@Override
	public List<B2BCustomerModel> getAllNonServicebleCustomersForDistributor(final String currentUserId)
	{
		return dashboardCustomerService.getAllNonServicebleCustomersForDistributor(currentUserId);
	}

}
