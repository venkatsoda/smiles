/**
 *
 */
package com.smiles.service.order.impl;

import de.hybris.platform.commerceservices.customer.CustomerAccountService;
import de.hybris.platform.core.enums.OrderStatus;
import de.hybris.platform.core.model.order.OrderModel;
import de.hybris.platform.core.model.user.UserModel;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.FlexibleSearchService;
import de.hybris.platform.servicelayer.search.SearchResult;
import de.hybris.platform.servicelayer.user.impl.DefaultUserService;
import de.hybris.platform.store.BaseStoreModel;
import de.hybris.platform.store.services.BaseStoreService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.smiles.dao.order.DashboardOrderDao;
import com.smiles.service.order.DashboardOrderService;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardOrderServiceImpl implements DashboardOrderService
{
	protected static final Logger LOG = Logger.getLogger(DashboardOrderServiceImpl.class);
	private DashboardOrderDao dashboardOrderDao;

	@Autowired
	private DefaultUserService userService;

	@Autowired
	private FlexibleSearchService flexibleSearchService;

	@Resource(name = "customerAccountService")
	private CustomerAccountService customerAccountService;

	@Resource(name = "baseStoreService")
	private BaseStoreService baseStoreService;

	@Override
	public List<OrderModel> getDistributorOrders(final String currentUserId, final Date fromDate, final Date toDate)
	{
		final List<OrderModel> orderHistoryList = dashboardOrderDao.getDistributorOrders(currentUserId, fromDate, toDate);
		return orderHistoryList;
	}

	@Override
	public List<OrderModel> getDistributorAllOrders(final String currentUserId)
	{
		final List<OrderModel> orderHistoryList = dashboardOrderDao.getDistributorAllOrders(currentUserId);
		return orderHistoryList;
	}

	/**
	 * @return the dashboardOrderDao
	 */
	public DashboardOrderDao getDashboardOrderDao()
	{
		return dashboardOrderDao;
	}

	/**
	 * @param dashboardOrderDao
	 *           the dashboardOrderDao to set
	 */
	public void setDashboardOrderDao(final DashboardOrderDao dashboardOrderDao)
	{
		this.dashboardOrderDao = dashboardOrderDao;
	}

	@Override
	public List<OrderModel> getOrderDetails(final String orderNumber, final String orderStatus, final String customerId,
			final Date fromDate, final Date toDate)
	{
		String ordStatus = null;
		final List<OrderModel> orderHistoryList = new ArrayList<OrderModel>();
		final UserModel currentUser = userService.getCurrentUser();
		userService.setCurrentUser(userService.getAdminUser());
		if (!orderNumber.equalsIgnoreCase(""))
		{
			//final OrderModel om = new OrderModel();
			//om.setCode(orderNumber);
			try
			{
				final BaseStoreModel baseStoreModel = baseStoreService.getCurrentBaseStore();
				//final OrderModel orderModel = flexibleSearchService.getModelByExample(om);
				final OrderModel orderModel = customerAccountService.getOrderForCode(orderNumber, baseStoreModel);
				//final OrderModel orderModel = flexibleSearchService.getModelByExample(om);
				userService.setCurrentUser(currentUser);
				orderHistoryList.add(orderModel);
			}
			catch (final Exception e)
			{
				LOG.error(e.getMessage());
			}
		}
		else
		{
			if (orderStatus.equalsIgnoreCase("no"))
			{
				ordStatus = OrderStatus.CREATED.toString();
			}
			else if (orderStatus.equalsIgnoreCase("yes"))
			{
				ordStatus = OrderStatus.COMPLETED.toString();
			}
			else if (orderStatus.equalsIgnoreCase("cancelled"))
			{
				ordStatus = OrderStatus.CANCELLED.toString();
			}
			else if (orderStatus.equalsIgnoreCase("Rejected"))
			{
				ordStatus = OrderStatus.REJECTED.toString();
			}
			else
			{
				ordStatus = "";
			}
			final List<OrderModel> orderModelList = getOrdersByStatus(ordStatus, customerId, fromDate, toDate);
			if (orderModelList != null)
			{
				orderHistoryList.addAll(orderModelList);
			}
			userService.setCurrentUser(currentUser);

		}

		userService.setCurrentUser(currentUser);
		return orderHistoryList;
	}

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
	public List<OrderModel> getOrdersByStatus(final String orderStatus, final String customerId, final Date from, final Date to)
	{
		final UserModel currentUser = userService.getCurrentUser();
		SearchResult<OrderModel> searchResult = null;
		List<OrderModel> rslt = null;
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
		try
		{
			if (!orderStatus.equalsIgnoreCase(""))
			{
				FlexibleSearchQuery query = new FlexibleSearchQuery(
						new String("SELECT {pk} from {OrderStatus} where {code}='" + orderStatus + "'"));

				final List status1 = flexibleSearchService.search(query).getResult();
				LOG.info(status1.get(0).toString().substring(23, 36));

				query = new FlexibleSearchQuery(new String("SELECT {PK} from {BaseStore} where {uid} = 'distBRStore' "));
				final List storeId = flexibleSearchService.search(query).getResult();
				final BaseStoreModel bsm = (BaseStoreModel) storeId.get(0);

				LOG.info(flexibleSearchService.search(query).getResult());
				query = new FlexibleSearchQuery(new String("select {pk} from {user} where {UID}='" + customerId + "'"));
				final List userid = flexibleSearchService.search(query).getResult();
				final UserModel umid = (UserModel) userid.get(0);

				StringBuffer flexQuery = new StringBuffer("SELECT {pk} from {").append(OrderModel._TYPECODE).append("} where {")
						.append(OrderModel.STORE).append("}='").append(bsm.getPk()).append("' and  {").append(OrderModel.STATUS)
						.append("}='").append(status1.get(0).toString().substring(23, 36)).append("' and {")
						.append(OrderModel.VERSIONID).append("} IS NULL  and {").append(OrderModel.USER).append("}='")
						.append(umid.getPk()).append("'");

				if (fromDate != null)
				{
					flexQuery = flexQuery.append(" AND {").append(OrderModel.CREATIONTIME).append("} >= '").append(fromDate)
							.append("'");
				}
				if (toDate != null)
				{
					flexQuery = flexQuery.append(" AND {").append(OrderModel.CREATIONTIME).append("} <= '").append(toDate).append("'");
				}
				query = new FlexibleSearchQuery(new String(flexQuery.toString()));
				userService.setCurrentUser(userService.getAdminUser());
				searchResult = flexibleSearchService.search(query);
				rslt = searchResult.getResult();
				userService.setCurrentUser(currentUser);
				if (CollectionUtils.isEmpty(rslt))
				{
					return null;
				}
			}
			else
			{
				final FlexibleSearchQuery query1 = new FlexibleSearchQuery(
						new String("SELECT {PK} from {BaseStore} where {uid} = 'distBRStore' "));
				final List storeId = flexibleSearchService.search(query1).getResult();
				final BaseStoreModel bsm = (BaseStoreModel) storeId.get(0);
				final FlexibleSearchQuery query2 = new FlexibleSearchQuery(
						new String("select {pk} from {user} where {UID}='" + customerId + "'"));
				final List userid = flexibleSearchService.search(query2).getResult();
				final UserModel umid = (UserModel) userid.get(0);
				StringBuffer flexQuery = new StringBuffer(
						"SELECT {pk} from {Order} where {store}='" + bsm.getPk() + "' and {distributor}='" + umid.getPk() + "'");

				if (fromDate != null)
				{
					flexQuery = flexQuery.append(" AND {").append(OrderModel.CREATIONTIME).append("} >= '").append(fromDate)
							.append("'");
				}
				if (toDate != null)
				{
					flexQuery = flexQuery.append(" AND {").append(OrderModel.CREATIONTIME).append("} <= '").append(toDate).append("'");
				}

				final FlexibleSearchQuery query = new FlexibleSearchQuery(new String(flexQuery.toString()));
				userService.setCurrentUser(userService.getAdminUser());
				searchResult = flexibleSearchService.search(query);
				userService.setCurrentUser(currentUser);
				rslt = searchResult.getResult();
			}
		}
		catch (final Exception e)
		{
			e.printStackTrace();
			userService.setCurrentUser(currentUser);
		}
		return rslt;
	}
}
