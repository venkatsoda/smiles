/**
 *
 */
package com.smiles.dao.customer.impl;

import de.hybris.platform.b2b.model.B2BCustomerModel;
import de.hybris.platform.core.model.user.UserModel;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import de.hybris.platform.servicelayer.user.impl.DefaultUserService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;

import com.smiles.dao.customer.DashboardCustomerDao;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardCustomerDaoImpl implements DashboardCustomerDao
{
	private static final Logger LOG = Logger.getLogger(DashboardCustomerDaoImpl.class);

	private DefaultUserService userService;

	private FlexibleSearchService flexibleSearchService;

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.dao.customer.DashboardCustomerDao#getAllCustomersForDistributor()
	 */
	@Override
	public List<B2BCustomerModel> getAllCustomersForDistributor(final String currentUserId)
	{
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		final List<B2BCustomerModel> distCustomerRegisterDataList = new ArrayList<B2BCustomerModel>();
		/*
		 * final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String(
		 * "select {c.pk} from {PrincipalGroupRelation as pr left join usergroup as ug on {pr.target} = {ug.pk} left join b2bcustomer as c on {c.pk}={pr.source}}where {ug.uid} ='b2bdistributorgroup'"
		 * ));
		 */


		final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String(
				"select {bc.pk} from {b2bunit as bu left join b2bcustomer as bc on {bu.pk} ={bc.defaultb2bunit} 	left join b2bcustomer as bc2 on {bu.distributor}={bc2.pk} } where {bc2.uid} =?distributorID"));
		query2.addQueryParameter("distributorID", currentUserId);
		//final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String("select {pk} from {b2bcustomer}"));
		final SearchResult<B2BCustomerModel> searchResult1 = flexibleSearchService.search(query2);
		final List<B2BCustomerModel> customerModel = searchResult1.getResult();
		distCustomerRegisterDataList.addAll(customerModel);
		userService.setCurrentUser(currentUser);
		return distCustomerRegisterDataList;
	}

	public B2BCustomerModel getCustomerforPK(final String UID)
	{
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		final List<B2BCustomerModel> distCustomerRegisterDataList = new ArrayList<B2BCustomerModel>();
		final FlexibleSearchQuery query2 = new FlexibleSearchQuery(
				new String("select {u.pk} from {B2BCustomer as u} where {uid} =?UID"));
		query2.addQueryParameter("UID", UID);

		final SearchResult<B2BCustomerModel> searchResult1 = flexibleSearchService.search(query2);

		final List<B2BCustomerModel> customerModel = searchResult1.getResult();
		distCustomerRegisterDataList.addAll(customerModel);
		userService.setCurrentUser(currentUser);
		return distCustomerRegisterDataList.get(0);
	}

	/**
	 * @return the userService
	 */
	public DefaultUserService getUserService()
	{
		return userService;
	}

	/**
	 * @param userService
	 *           the userService to set
	 */
	public void setUserService(final DefaultUserService userService)
	{
		this.userService = userService;
	}

	/**
	 * @return the flexibleSearchService
	 */
	public FlexibleSearchService getFlexibleSearchService()
	{
		return flexibleSearchService;
	}

	/**
	 * @param flexibleSearchService
	 *           the flexibleSearchService to set
	 */
	public void setFlexibleSearchService(final FlexibleSearchService flexibleSearchService)
	{
		this.flexibleSearchService = flexibleSearchService;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.dao.customer.DashboardCustomerDao#getB2BCustomerByUid(java.lang.String)
	 */
	@Override
	public B2BCustomerModel getB2BCustomerByUid(final String uid)
	{
		final FlexibleSearchQuery query = new FlexibleSearchQuery(
				new String("SELECT {PK} from {b2bcustomer} where {uid} = '" + uid.toLowerCase() + "' "));
		final SearchResult<B2BCustomerModel> searchResult = flexibleSearchService.search(query);
		if (CollectionUtils.isNotEmpty(searchResult.getResult()))
		{
			return searchResult.getResult().get(0);
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.dao.customer.DashboardCustomerDao#getAllDistributors()
	 */
	@Override
	public List<B2BCustomerModel> getAllDistributors()
	{
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		final List<B2BCustomerModel> distCustomerRegisterDataList = new ArrayList<B2BCustomerModel>();
		final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String(
				"select {c.pk} from {PrincipalGroupRelation as pr left join usergroup as ug on {pr.target} = {ug.pk} left join b2bcustomer as c on {c.pk}={pr.source}}where {ug.uid} ='b2bdistributorgroup'"));


		final SearchResult<B2BCustomerModel> searchResult1 = flexibleSearchService.search(query2);
		final List<B2BCustomerModel> customerModel = searchResult1.getResult();
		distCustomerRegisterDataList.addAll(customerModel);
		userService.setCurrentUser(currentUser);
		return distCustomerRegisterDataList;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.colpal.distbraddon.dao.customer.DashboardCustomerDao#SearchCustomers(java.lang.String, java.lang.String,
	 * boolean)
	 */
	@Override
	public List<B2BCustomerModel> SearchCustomers(final String currentUserId, final String custName, final String custUid,
			final boolean isServiceable)
	{
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		StringBuffer flexibleQuery = new StringBuffer(
				("select {bc.pk} from {b2bunit as bu left join b2bcustomer as bc on {bu.pk} ={bc.defaultb2bunit} 	left join b2bcustomer as bc2 on {bu.distributor}={bc2.pk} } where {bc2.uid} =?distributorID"));
		if (custName != null && !custName.isEmpty())
		{
			flexibleQuery = flexibleQuery.append(" AND LOWER({bc.name}) LIKE LOWER (?custName)");
		}
		if (custUid != null && !custUid.isEmpty())
		{
			flexibleQuery = flexibleQuery.append(" AND {bc.customerid} = '" + custUid + "'");
		}
		if (isServiceable)
		{
			flexibleQuery = flexibleQuery.append(" AND {bc.serviceable} = 1 ");
		}
		try
		{
			final FlexibleSearchQuery query = new FlexibleSearchQuery(new String(flexibleQuery.toString()));
			query.addQueryParameter("distributorID", currentUserId);
			query.addQueryParameter("custName", "%" + custName + "%");
			userService.setCurrentUser(userService.getAdminUser());
			final SearchResult<B2BCustomerModel> searchResult = flexibleSearchService.search(query);
			userService.setCurrentUser(currentUser);
			return searchResult.getResult();
		}
		catch (final Exception e)
		{
			LOG.error(e.getMessage(), e);
			userService.setCurrentUser(currentUser);
		}
		return Collections.EMPTY_LIST;

	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.colpal.distbraddon.dao.customer.DashboardCustomerDao#getAllNonServicebleCustomersForDistributor(java.lang.
	 * String)
	 */
	@Override
	public List<B2BCustomerModel> getAllNonServicebleCustomersForDistributor(final String currentUserId)
	{
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		final List<B2BCustomerModel> distCustomerRegisterDataList = new ArrayList<B2BCustomerModel>();
		/*
		 * final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String(
		 * "select {c.pk} from {PrincipalGroupRelation as pr left join usergroup as ug on {pr.target} = {ug.pk} left join b2bcustomer as c on {c.pk}={pr.source}}where {ug.uid} ='b2bdistributorgroup'"
		 * ));
		 */


		final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String(
				"select {bc.pk} from {b2bunit as bu left join b2bcustomer as bc on {bu.pk} ={bc.defaultb2bunit} 	left join b2bcustomer as bc2 on {bu.distributor}={bc2.pk} } where {bc2.uid} =?distributorID  AND {bc.serviceable} = 0 "));
		query2.addQueryParameter("distributorID", currentUserId);
		//final FlexibleSearchQuery query2 = new FlexibleSearchQuery(new String("select {pk} from {b2bcustomer}"));
		final SearchResult<B2BCustomerModel> searchResult1 = flexibleSearchService.search(query2);
		final List<B2BCustomerModel> customerModel = searchResult1.getResult();
		distCustomerRegisterDataList.addAll(customerModel);
		userService.setCurrentUser(currentUser);
		return distCustomerRegisterDataList;
	}


}
