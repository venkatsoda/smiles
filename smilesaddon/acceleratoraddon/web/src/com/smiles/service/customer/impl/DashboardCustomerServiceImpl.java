/**
 *
 */
package com.smiles.service.customer.impl;

import de.hybris.platform.b2b.model.B2BCustomerModel;

import java.util.List;

import com.smiles.dao.customer.DashboardCustomerDao;
import com.smiles.service.customer.DashboardCustomerService;



/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public class DashboardCustomerServiceImpl implements DashboardCustomerService
{
	private DashboardCustomerDao dashboardCustomerDao;

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.service.customer.DashboardCustomerService#getAllCustomersForDistributor()
	 */
	@Override
	public List<B2BCustomerModel> getAllCustomersForDistributor(final String currentUserId)
	{
		return dashboardCustomerDao.getAllCustomersForDistributor(currentUserId);
	}

	@Override
	public B2BCustomerModel getCustomerforPK(final String PK)
	{
		return dashboardCustomerDao.getCustomerforPK(PK);
	}

	/**
	 * @return the dashboardCustomerDao
	 */
	public DashboardCustomerDao getDashboardCustomerDao()
	{
		return dashboardCustomerDao;
	}

	/**
	 * @param dashboardCustomerDao
	 *           the dashboardCustomerDao to set
	 */
	public void setDashboardCustomerDao(final DashboardCustomerDao dashboardCustomerDao)
	{
		this.dashboardCustomerDao = dashboardCustomerDao;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.service.customer.DashboardCustomerService#getB2BCustomerByUid(java.lang.String)
	 */
	@Override
	public B2BCustomerModel getB2BCustomerByUid(final String uid)
	{

		return dashboardCustomerDao.getB2BCustomerByUid(uid);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see com.hm.dashbord.service.customer.DashboardCustomerService#getAllDistributors()
	 */
	@Override
	public List<B2BCustomerModel> getAllDistributors()
	{

		return dashboardCustomerDao.getAllDistributors();
	}

	@Override
	public List<B2BCustomerModel> SearchCustomers(final String currentUserId, final String custName, final String custUid,
			final boolean isServiceable)
	{
		return dashboardCustomerDao.SearchCustomers(currentUserId, custName, custUid, isServiceable);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.colpal.distbraddon.service.customer.DashboardCustomerService#getAllNonServicebleCustomersForDistributor(java.
	 * lang.String)
	 */
	@Override
	public List<B2BCustomerModel> getAllNonServicebleCustomersForDistributor(final String currentUserId)
	{
		return dashboardCustomerDao.getAllNonServicebleCustomersForDistributor(currentUserId);
	}
}
