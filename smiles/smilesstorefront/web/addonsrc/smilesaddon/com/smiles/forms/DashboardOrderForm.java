/**
 *
 */
package com.smiles.forms;

/**
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardOrderForm
{

	/**
	 * @return the orderNumber
	 */
	public String getOrderNumber()
	{
		return orderNumber;
	}

	/**
	 * @param orderNumber
	 *           the orderNumber to set
	 */
	public void setOrderNumber(final String orderNumber)
	{
		this.orderNumber = orderNumber;
	}

	/**
	 * @return the orderStatus
	 */
	public String getOrderStatus()
	{
		return orderStatus;
	}

	/**
	 * @param orderStatus
	 *           the orderStatus to set
	 */
	public void setOrderStatus(final String orderStatus)
	{
		this.orderStatus = orderStatus;
	}

	/**
	 * @return the fromDate
	 */
	public String getFromDate()
	{
		return fromDate;
	}

	/**
	 * @param fromDate
	 *           the fromDate to set
	 */
	public void setFromDate(final String fromDate)
	{
		this.fromDate = fromDate;
	}

	/**
	 * @return the toDate
	 */
	public String getToDate()
	{
		return toDate;
	}

	/**
	 * @param toDate
	 *           the toDate to set
	 */
	public void setToDate(final String toDate)
	{
		this.toDate = toDate;
	}

	private String orderNumber;
	private String orderStatus;
	private String fromDate;
	private String toDate;
	private String reason;

	/**
	 * @return the reason
	 */
	public String getReason()
	{
		return reason;
	}

	/**
	 * @param reason
	 *           the reason to set
	 */
	public void setReason(final String reason)
	{
		this.reason = reason;
	}
}
