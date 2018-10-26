/*
 * [y] hybris Platform
 *
 * Copyright (c) 2017 SAP SE or an SAP affiliate company.  All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
package com.smiles.controllers;

import com.smiles.constants.SmilesaddonConstants;


/**
 */
public interface ControllerConstants
{
	interface Views
	{
		interface Pages
		{
			interface Error
			{
				String ErrorNotFoundPage = "pages/error/errorNotFoundPage";
			}

			interface DashBoard
			{
				String ADD_ON_PREFIX = "addon:";
				String VIEW_PAGE_PREFIX = ADD_ON_PREFIX + "/" + SmilesaddonConstants.EXTENSIONNAME + "/";

				String distributorAllOrdersPage = VIEW_PAGE_PREFIX + "pages/dashboard/distributorAllOrdersPage";
				String distributorOrderDetailPage = VIEW_PAGE_PREFIX + "pages/dashboard/distributorOrderDetailPage";
			}
		}
	}
}
