/**
 *
 */
package com.smiles.service.order;

import de.hybris.platform.core.model.order.OrderModel;

import java.util.Date;
import java.util.List;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public interface DashboardOrderService
{
	public List<OrderModel> getDistributorOrders(String currentUserId, Date fromDate, Date toDate);

	public List<OrderModel> getDistributorAllOrders(String currentUserId);

	public List<OrderModel> getOrderDetails(final String orderNumber, String orderStatus, final String customerId,
			final Date fromDate, final Date toDate);

	public List<OrderModel> getOrdersByStatus(final String orderStatus, final String customerId, final Date fromDate,
			final Date toDate);
}
