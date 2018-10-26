/**
 *
 */
package com.smiles.facades.customer;

import de.hybris.platform.b2b.model.B2BCustomerModel;

import java.util.List;


/**
 *
 * @author Bhanuprakash.Boopur
 *
 */
public interface DashboardCustomerFacade
{
	public List<B2BCustomerModel> getAllCustomersForDistributor(final String currentUserId);

	public B2BCustomerModel getCustomerforPK(String PK);


	public B2BCustomerModel getB2BCustomerByUid(final String uid);

	public List<B2BCustomerModel> getAllDistributors();


	public List<B2BCustomerModel> SearchCustomers(final String currentUserId, final String custName, final String custUid,
			final boolean isServiceable);

	public List<B2BCustomerModel> getAllNonServicebleCustomersForDistributor(final String currentUserId);

}
