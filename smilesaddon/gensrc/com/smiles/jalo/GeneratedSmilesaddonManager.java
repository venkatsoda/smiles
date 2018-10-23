/*
 * ----------------------------------------------------------------
 * --- WARNING: THIS FILE IS GENERATED AND WILL BE OVERWRITTEN! ---
 * --- Generated at Oct 23, 2018 12:23:02 PM                    ---
 * ----------------------------------------------------------------
 */
package com.smiles.jalo;

import com.smiles.constants.SmilesaddonConstants;
import de.hybris.platform.b2b.jalo.B2BCustomer;
import de.hybris.platform.jalo.Item;
import de.hybris.platform.jalo.Item.AttributeMode;
import de.hybris.platform.jalo.SessionContext;
import de.hybris.platform.jalo.extension.Extension;
import de.hybris.platform.jalo.user.Customer;
import de.hybris.platform.jalo.user.User;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Generated class for type <code>SmilesaddonManager</code>.
 */
@SuppressWarnings({"deprecation","unused","cast","PMD"})
public abstract class GeneratedSmilesaddonManager extends Extension
{
	protected static final Map<String, Map<String, AttributeMode>> DEFAULT_INITIAL_ATTRIBUTES;
	static
	{
		final Map<String, Map<String, AttributeMode>> ttmp = new HashMap();
		Map<String, AttributeMode> tmp = new HashMap<String, AttributeMode>();
		tmp.put("isDistributor", AttributeMode.INITIAL);
		tmp.put("distributor", AttributeMode.INITIAL);
		ttmp.put("de.hybris.platform.jalo.user.Customer", Collections.unmodifiableMap(tmp));
		DEFAULT_INITIAL_ATTRIBUTES = ttmp;
	}
	@Override
	public Map<String, AttributeMode> getDefaultAttributeModes(final Class<? extends Item> itemClass)
	{
		Map<String, AttributeMode> ret = new HashMap<>();
		final Map<String, AttributeMode> attr = DEFAULT_INITIAL_ATTRIBUTES.get(itemClass.getName());
		if (attr != null)
		{
			ret.putAll(attr);
		}
		return ret;
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.distributor</code> attribute.
	 * @return the distributor
	 */
	public B2BCustomer getDistributor(final SessionContext ctx, final Customer item)
	{
		return (B2BCustomer)item.getProperty( ctx, SmilesaddonConstants.Attributes.Customer.DISTRIBUTOR);
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.distributor</code> attribute.
	 * @return the distributor
	 */
	public B2BCustomer getDistributor(final Customer item)
	{
		return getDistributor( getSession().getSessionContext(), item );
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.distributor</code> attribute. 
	 * @param value the distributor
	 */
	public void setDistributor(final SessionContext ctx, final Customer item, final B2BCustomer value)
	{
		item.setProperty(ctx, SmilesaddonConstants.Attributes.Customer.DISTRIBUTOR,value);
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.distributor</code> attribute. 
	 * @param value the distributor
	 */
	public void setDistributor(final Customer item, final B2BCustomer value)
	{
		setDistributor( getSession().getSessionContext(), item, value );
	}
	
	@Override
	public String getName()
	{
		return SmilesaddonConstants.EXTENSIONNAME;
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.isDistributor</code> attribute.
	 * @return the isDistributor
	 */
	public Boolean isIsDistributor(final SessionContext ctx, final Customer item)
	{
		return (Boolean)item.getProperty( ctx, SmilesaddonConstants.Attributes.Customer.ISDISTRIBUTOR);
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.isDistributor</code> attribute.
	 * @return the isDistributor
	 */
	public Boolean isIsDistributor(final Customer item)
	{
		return isIsDistributor( getSession().getSessionContext(), item );
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.isDistributor</code> attribute. 
	 * @return the isDistributor
	 */
	public boolean isIsDistributorAsPrimitive(final SessionContext ctx, final Customer item)
	{
		Boolean value = isIsDistributor( ctx,item );
		return value != null ? value.booleanValue() : false;
	}
	
	/**
	 * <i>Generated method</i> - Getter of the <code>Customer.isDistributor</code> attribute. 
	 * @return the isDistributor
	 */
	public boolean isIsDistributorAsPrimitive(final Customer item)
	{
		return isIsDistributorAsPrimitive( getSession().getSessionContext(), item );
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.isDistributor</code> attribute. 
	 * @param value the isDistributor
	 */
	public void setIsDistributor(final SessionContext ctx, final Customer item, final Boolean value)
	{
		item.setProperty(ctx, SmilesaddonConstants.Attributes.Customer.ISDISTRIBUTOR,value);
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.isDistributor</code> attribute. 
	 * @param value the isDistributor
	 */
	public void setIsDistributor(final Customer item, final Boolean value)
	{
		setIsDistributor( getSession().getSessionContext(), item, value );
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.isDistributor</code> attribute. 
	 * @param value the isDistributor
	 */
	public void setIsDistributor(final SessionContext ctx, final Customer item, final boolean value)
	{
		setIsDistributor( ctx, item, Boolean.valueOf( value ) );
	}
	
	/**
	 * <i>Generated method</i> - Setter of the <code>Customer.isDistributor</code> attribute. 
	 * @param value the isDistributor
	 */
	public void setIsDistributor(final Customer item, final boolean value)
	{
		setIsDistributor( getSession().getSessionContext(), item, value );
	}
	
}
