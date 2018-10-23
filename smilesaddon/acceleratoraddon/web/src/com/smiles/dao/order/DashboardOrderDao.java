/**
 *
 */
package com.smiles.dao.order;

import de.hybris.platform.core.model.order.OrderModel;

import java.util.Date;
import java.util.List;


/**
 * @author Soda.raveendra
 *
 */
public interface DashboardOrderDao
{
	public List<OrderModel> getDistributorOrders(String currentUserId, Date fromDate, Date toDate);

	public List<OrderModel> getDistributorAllOrders(String currentUserId);
}
