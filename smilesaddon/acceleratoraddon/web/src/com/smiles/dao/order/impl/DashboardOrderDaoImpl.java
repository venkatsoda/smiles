/**
 *
 */
package com.smiles.dao.order.impl;

/**
 * @author Soda.raveendra
 *
 */


import de.hybris.platform.b2b.model.B2BCustomerModel;
import de.hybris.platform.core.model.order.OrderModel;
import de.hybris.platform.core.model.user.UserModel;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import de.hybris.platform.servicelayer.user.UserService;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;

import com.smiles.dao.customer.DashboardCustomerDao;
import com.smiles.dao.order.DashboardOrderDao;




/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardOrderDaoImpl implements DashboardOrderDao
{
	private UserService userService;
	private FlexibleSearchService flexibleSearchService;
	@Autowired
	private DashboardCustomerDao dashboardCustomerDao;


	private String getDateInStringFormat(final Date date)
	{
		final String format = "yyyy-MM-dd HH:mm:ss";
		final SimpleDateFormat dateFormat = new SimpleDateFormat(format, Locale.ENGLISH);
		String dateInStr = null;
		try
		{
			dateInStr = dateFormat.format(date);
		}
		catch (final Exception e)
		{
			e.printStackTrace();
		}

		return dateInStr;

	}

	@Override
	public List<OrderModel> getDistributorOrders(final String currentUserId, final Date from, final Date to)
	{
		final UserModel currentUser = userService.getCurrentUser();

		if (from != null)
		{
			from.setHours(0);
			from.setMinutes(0);
			from.setSeconds(1);
		}
		final String fromDate = getDateInStringFormat(from);
		if (to != null)
		{
			to.setHours(23);
			to.setMinutes(59);
			to.setSeconds(59);
		}
		final String toDate = getDateInStringFormat(to);

		final B2BCustomerModel existingCustomer = dashboardCustomerDao.getB2BCustomerByUid(currentUserId);
		StringBuffer flexibleQuery = new StringBuffer(
				"SELECT {PK} from {Order as o join OrderStatus as s on {o.status}={s.pk}} where {o.distributor}=?distributor and {o.versionID} IS NULL and {s.code}  NOT IN ('CANCELLED','COMPLETED')");

		if (fromDate != null)
		{
			flexibleQuery = flexibleQuery.append(" AND {" + OrderModel.CREATIONTIME + "} >= '" + fromDate + "'");
		}
		if (toDate != null)
		{
			flexibleQuery = flexibleQuery.append(" AND {" + OrderModel.CREATIONTIME + "} <= '" + toDate + "'");
		}
		flexibleQuery = flexibleQuery.append(" Order By {creationtime} DESC");
		try
		{
			final FlexibleSearchQuery query = new FlexibleSearchQuery(new String(flexibleQuery.toString()));
			query.addQueryParameter("distributor", existingCustomer.getPk());
			userService.setCurrentUser(userService.getAdminUser());
			final SearchResult<OrderModel> searchResult = flexibleSearchService.search(query);
			userService.setCurrentUser(currentUser);
			return searchResult.getResult();
		}
		catch (final Exception e)
		{
			e.printStackTrace();
			userService.setCurrentUser(currentUser);
		}
		return Collections.EMPTY_LIST;
	}

	@Override
	public List<OrderModel> getDistributorAllOrders(final String currentUserId)
	{
		final B2BCustomerModel existingCustomer = dashboardCustomerDao.getB2BCustomerByUid(currentUserId);
		final FlexibleSearchQuery query = new FlexibleSearchQuery(new String(
				"SELECT {PK} from {Order} where {distributor}=?distributor and {versionID} IS NULL Order By {creationtime} DESC"));
		query.addQueryParameter("distributor", existingCustomer.getPk());
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		final SearchResult<OrderModel> searchResult = flexibleSearchService.search(query);
		userService.setCurrentUser(currentUser);
		return searchResult.getResult();
	}

	/**
	 * @return the userService
	 */
	public UserService getUserService()
	{
		return userService;
	}

	/**
	 * @param userService
	 *           the userService to set
	 */
	public void setUserService(final UserService userService)
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


}
