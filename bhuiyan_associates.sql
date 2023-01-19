-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 10:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bhuiyan_associates`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE `tbl_assets` (
  `as_id` int(11) NOT NULL,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_sp_name` varchar(100) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `buy_or_sale` enum('buy','sale') NOT NULL DEFAULT 'buy',
  `valuation` decimal(20,2) DEFAULT 0.00,
  `unit_valuation` decimal(20,2) DEFAULT 0.00,
  `as_note` text DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

CREATE TABLE `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

CREATE TABLE `tbl_brunch` (
  `brunch_id` int(11) NOT NULL,
  `MainBranch_Id` int(11) DEFAULT NULL,
  `Brunch_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Brunch_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Brunch_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `is_production` varchar(20) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `MainBranch_Id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`, `is_production`) VALUES
(1, NULL, 'Main Branch', 'Bhuiyan Associates', '187- East Kazi Para, Mirpur-10, \nDhaka-1216\nPhone : 01911-978897', '', '2022-06-04', '2022-06-04 13:10:33', '', 'Admin', 'a', 'true'),
(2, 1, 'Ware House ', 'Ware House ', 'Ware House ', '2', '0000-00-00', '2022-11-26 17:42:10', 'Admin', '', 'a', 'false'),
(3, NULL, 'Branch 2', 'Branch 2', 'Branch 2', '2', '0000-00-00', '2022-12-15 20:14:44', 'Admin', 'Admin', 'a', 'false'),
(4, 14, 'Ware House of Branch 2', 'Ware House of Branch 2', 'Ware House of Branch 2', '2', '0000-00-00', '2022-12-15 20:15:09', 'Admin', '', 'a', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

CREATE TABLE `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

CREATE TABLE `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_SiNo` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` text NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`) VALUES
(1, 'Bhuiyan Associates', '187- East Kazi Para, Mirpur, Dhaka-1216\r\nPhone : 01911-978897', 'linkup.jpg', 'linkup.jpg', 1, 'BDT', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `Country_SlNo` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

CREATE TABLE `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `production_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `production_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 40, 118, 0, 50, 20, 0, 0, 0, 10, 1),
(2, 37, 10, 0, 0, 0, 0, 0, 0, 9, 1),
(3, 35, 100, 0, 0, 10, 0, 0, 0, 0, 1),
(4, 40, 10, 0, 0, 0, 0, 0, 10, 0, 13),
(5, 37, 10, 0, 0, 0, 0, 0, 9, 0, 13),
(6, 40, 100, 0, 0, 0, 0, 0, 0, 0, 14),
(7, 39, 100, 0, 0, 0, 0, 0, 0, 0, 14),
(8, 38, 100, 0, 0, 0, 0, 0, 0, 0, 14),
(9, 37, 100, 0, 0, 0, 0, 0, 0, 0, 14),
(10, 36, 100, 0, 0, 0, 0, 0, 0, 0, 14),
(11, 38, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(12, 3, 0, 0, 1, 0, 0, 0, 0, 0, 1),
(13, 39, 0, 0, 20, 0, 0, 0, 0, 0, 1),
(14, 33, 0, 0, 10, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL,
  `Customer_Code` varchar(50) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL DEFAULT 0,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `Customer_Name`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `employees_id`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', 'Zac', 'retail', '', '011425654', '', '', 'Dhaka', '', 0, 1, 1, '', '1000000.00', '0.00', NULL, 'a', 'Admin', '2022-11-26 17:45:44', 'Admin', '2022-12-17 13:04:32', 1),
(2, 'C00002', 'Md Sohel Rana', 'retail', '', '01721850242', '', '', 'Dhaka', 'Link Up', 0, 1, 0, '', '100000.00', '0.00', NULL, 'a', 'Admin', '2022-12-15 21:18:31', NULL, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_customerID` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `CPayment_discount` decimal(18,2) NOT NULL,
  `out_amount` float NOT NULL DEFAULT 0,
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `CPayment_notes` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT 0,
  `CPayment_Addby` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`CPayment_id`, `CPayment_date`, `CPayment_invoice`, `CPayment_customerID`, `CPayment_TransactionType`, `CPayment_amount`, `CPayment_discount`, `out_amount`, `CPayment_Paymentby`, `account_id`, `CPayment_notes`, `CPayment_brunchid`, `CPayment_previous_due`, `CPayment_Addby`, `CPayment_AddDAte`, `CPayment_status`, `update_by`, `CPayment_UpdateDAte`) VALUES
(1, '2022-11-26', 'TR00001', '1', 'CR', '1400.00', '970.00', 0, 'cash', NULL, '', 1, 14970, 'Admin', '2022-11-26', 'a', NULL, NULL),
(2, '2022-12-17', 'TR00002', '1', 'CR', '500.00', '100.00', 0, 'cash', NULL, '', 1, 12600, 'Admin', '2022-12-17', 'a', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

CREATE TABLE `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` float NOT NULL,
  `damage_rate` float NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `Department_SlNo` int(11) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`Department_SlNo`, `Department_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Admin', 'a', 'Admin', '2022-11-26 17:46:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`Designation_SlNo`, `Designation_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Executive', 'a', 'Admin', '2022-11-26 17:46:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `District_SlNo` int(11) NOT NULL,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Dhaka', 'a', 'Admin', '2022-11-26 17:45:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `bio_id` varchar(50) DEFAULT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` text NOT NULL,
  `Employee_PermanentAddress` text NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `Employee_Reference` text DEFAULT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`Employee_SlNo`, `Designation_ID`, `Department_ID`, `Employee_ID`, `bio_id`, `Employee_Name`, `Employee_JoinDate`, `Employee_Gender`, `Employee_BirthDate`, `Employee_NID`, `Employee_ContactNo`, `Employee_Email`, `Employee_MaritalStatus`, `Employee_FatherName`, `Employee_MotherName`, `Employee_PrasentAddress`, `Employee_PermanentAddress`, `Employee_Pic_org`, `Employee_Pic_thum`, `salary_range`, `Employee_Reference`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Employee_brinchid`) VALUES
(1, 1, 1, 'E1001', '', 'Syed Onik Hussain', '2022-10-31', 'Male', '2022-11-26', '', '019795556664', 'jokodaw@mailinator.com', 'married', 'Mr X', 'Noorjahan', 'Vel modi ullamco vol', 'thdjn t', '', '', 30000, '', 'a', 'Admin', '2022-11-26 17:47:27', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

CREATE TABLE `tbl_employee_payment` (
  `id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `total_payment_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` char(2) DEFAULT 'a',
  `saved_by` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment_details`
--

CREATE TABLE `tbl_employee_payment_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `salary` decimal(20,2) NOT NULL DEFAULT 0.00,
  `benefit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `deduction` decimal(20,2) NOT NULL DEFAULT 0.00,
  `net_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payment` decimal(20,2) NOT NULL DEFAULT 0.00,
  `comment` text DEFAULT NULL,
  `saved_by` int(11) UNSIGNED DEFAULT NULL,
  `saved_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_head`
--

CREATE TABLE `tbl_expense_head` (
  `id` int(11) NOT NULL,
  `head_name` varchar(100) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` enum('a','d') DEFAULT 'a',
  `saved_by` int(11) DEFAULT NULL,
  `saved_datetime` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_account`
--

CREATE TABLE `tbl_investment_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_transactions`
--

CREATE TABLE `tbl_investment_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_accounts`
--

CREATE TABLE `tbl_loan_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `save_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_transactions`
--

CREATE TABLE `tbl_loan_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materialcategory`
--

CREATE TABLE `tbl_materialcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_materialcategory`
--

INSERT INTO `tbl_materialcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Moyda', '', 'd', 'Admin', '2022-03-22 17:58:40', '', '', 1),
(2, 'Fresh Moyda', '', 'a', 'Admin', '2022-03-22 17:58:58', '', '', 1),
(3, 'Teer Soyabin Oil', '', 'a', 'Admin', '2022-03-22 17:59:18', '', '', 1),
(4, 'Sugar', '', 'a', 'Admin', '2022-03-22 17:59:32', '', '', 1),
(5, 'Butter', '', 'a', 'Admin', '2022-03-22 17:59:47', 'Admin', '2022-12-18 12:20:29', 1),
(6, 'Garments', '', 'a', 'Admin', '2022-03-22 18:07:37', '', '', 1),
(7, 'Tea', '', 'a', 'Admin', '2022-12-18 14:34:13', '', '', 1),
(8, 'Gas', '', 'a', 'Admin', '2022-12-18 14:34:25', '', '', 1),
(9, 'Milk', '', 'a', 'Admin', '2022-12-18 14:34:33', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_materials`
--

CREATE TABLE `tbl_materials` (
  `material_id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `reorder_level` float NOT NULL,
  `purchase_rate` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_materials`
--

INSERT INTO `tbl_materials` (`material_id`, `code`, `name`, `category_id`, `reorder_level`, `purchase_rate`, `unit_id`, `status`, `branch_id`, `created_at`) VALUES
(1, 'M0001', 'Moyda', 2, 0, 42, 3, 1, 1, '2022-03-22 12:00:27'),
(2, 'M0002', 'Palmoil', 3, 0, 182, 3, 1, 1, '2022-03-22 12:01:18'),
(3, 'M0003', 'Lal Chini', 4, 0, 61, 3, 1, 1, '2022-03-22 12:01:44'),
(4, 'M0004', 'Butter Extra', 5, 0, 82, 1, 1, 1, '2022-03-22 12:02:23'),
(5, 'M0005', 'jipper', 6, 0, 20, 1, 1, 1, '2022-03-22 12:09:14'),
(6, 'M0006', 'Cotton', 6, 0, 55, 3, 1, 1, '2022-03-22 12:10:09'),
(7, 'M0007', 'febirc', 6, 0, 110, 6, 1, 1, '2022-03-22 12:13:53'),
(8, 'M0008', 'Thread', 6, 0, 60, 3, 1, 1, '2022-03-22 12:15:19'),
(9, 'M0009', 'button', 6, 0, 5, 1, 1, 1, '2022-03-22 12:33:08'),
(10, 'M0010', 'Admin', 2, 10, 120, 2, 0, 1, '2022-12-18 06:21:11'),
(11, 'M0011', 'Suta ', 6, 10, 100, 2, 1, 1, '2022-12-18 07:09:22'),
(12, 'M0012', 'Taza Tea', 7, 10, 50, 1, 1, 1, '2022-12-18 08:35:06'),
(13, 'M0013', 'Teer Sugar', 4, 10, 100, 1, 1, 1, '2022-12-18 08:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_damage`
--

CREATE TABLE `tbl_material_damage` (
  `damage_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `damage_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_material_damage`
--

INSERT INTO `tbl_material_damage` (`damage_id`, `invoice`, `damage_date`, `description`, `status`, `added_by`, `added_datetime`, `updated_by`, `updated_datetime`, `branch_id`) VALUES
(1, 'MD0001', '2022-12-18', '', 'a', 1, '2022-12-18 12:22:34', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_damage_details`
--

CREATE TABLE `tbl_material_damage_details` (
  `damage_details_id` int(11) NOT NULL,
  `damage_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `damage_quantity` float NOT NULL,
  `damage_rate` float NOT NULL DEFAULT 0,
  `damage_amount` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_material_damage_details`
--

INSERT INTO `tbl_material_damage_details` (`damage_details_id`, `damage_id`, `material_id`, `damage_quantity`, `damage_rate`, `damage_amount`, `status`, `branch_id`) VALUES
(1, 1, 4, 5, 82, 410, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_purchase`
--

CREATE TABLE `tbl_material_purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `purchase_for` int(11) NOT NULL,
  `sub_total` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `transport_cost` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `due` float DEFAULT NULL,
  `previous_due` float NOT NULL,
  `note` varchar(2000) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_material_purchase`
--

INSERT INTO `tbl_material_purchase` (`purchase_id`, `supplier_id`, `invoice_no`, `purchase_date`, `purchase_for`, `sub_total`, `vat`, `transport_cost`, `discount`, `total`, `paid`, `due`, `previous_due`, `note`, `status`, `branch_id`) VALUES
(1, 12, 'MP-0001', '2022-03-22', 1, 380000, 0, 0, 0, 380000, 380000, 0, 507000, '', 'a', 1),
(2, 12, 'MP-0002', '2022-03-22', 1, 25000, 0, 0, 0, 25000, 0, 25000, 507000, '', 'a', 1),
(3, 1, 'MP-0003', '2022-12-18', 1, 113100, 0, 0, 0, 113100, 100000, 13100, 134504, '', 'a', 1),
(4, 1, 'MP-0004', '2022-12-18', 1, 100000, 0, 0, 0, 100000, 0, 100000, 134504, '', 'd', 1),
(5, 1, 'MP-0005', '2022-12-18', 1, 155800, 0, 0, 0, 155800, 1900, 153900, 134504, '', 'a', 1),
(6, 1, 'MP-0006', '2022-12-18', 1, 4200, 0, 0, 0, 4200, 4000, 200, 301534, '', 'a', 1),
(7, 1, 'MP-0007', '2022-12-18', 1, 1500, 0, 0, 0, 1500, 1000, 500, 301734, '', 'a', 1),
(8, 3, 'MP-0008', '2022-12-18', 1, 820, 0, 0, 0, 820, 0, 820, 0, '', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material_purchase_details`
--

CREATE TABLE `tbl_material_purchase_details` (
  `purchase_detail_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `purchase_rate` float NOT NULL,
  `quantity` float NOT NULL,
  `total` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_material_purchase_details`
--

INSERT INTO `tbl_material_purchase_details` (`purchase_detail_id`, `purchase_id`, `material_id`, `purchase_rate`, `quantity`, `total`, `status`, `branch_id`) VALUES
(1, 1, 7, 110, 3000, 330000, 'a', 1),
(2, 1, 5, 20, 1000, 20000, 'a', 1),
(3, 1, 8, 60, 500, 30000, 'a', 1),
(4, 2, 9, 5, 5000, 25000, 'a', 1),
(12, 3, 9, 5, 1000, 5000, 'a', 1),
(11, 3, 5, 20, 1000, 20000, 'a', 1),
(10, 3, 4, 82, 1000, 82000, 'a', 1),
(8, 4, 11, 100, 1000, 100000, 'd', 1),
(9, 5, 4, 82, 1900, 155800, 'a', 1),
(13, 3, 3, 61, 100, 6100, 'a', 1),
(14, 6, 1, 42, 100, 4200, 'a', 1),
(15, 7, 13, 100, 10, 1000, 'a', 1),
(16, 7, 12, 50, 10, 500, 'a', 1),
(17, 8, 4, 82, 10, 820, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

CREATE TABLE `tbl_month` (
  `month_id` int(11) NOT NULL,
  `month_name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `Product_SlNo` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `convert_qty` decimal(10,0) NOT NULL,
  `convert_to_name` varchar(100) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `convert_qty`, `convert_to_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', 'My Romance ', 1, 0, 0, 'na', 0, 20, '650.00', '800.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-05 21:46:45', '', '', 1),
(2, 'P00002', 'My Tone Grace', 1, 0, 0, 'na', 0, 20, '250.00', '350.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-05 21:47:44', '', '', 1),
(3, 'P00003', 'Maruko', 2, 0, 0, 'na', 0, 2, '450.00', '1000.00', '0.00', '550.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-05 22:14:54', '', '', 1),
(4, 'P00004', 'Z1', 2, 0, 0, 'na', 0, 2, '450.00', '1000.00', '0.00', '550.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-05 22:15:37', '', '', 1),
(5, 'P00005', 'Z2', 2, 0, 0, 'na', 0, 2, '500.00', '1100.00', '0.00', '650.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-05 22:16:12', '', '', 1),
(6, 'P00006', 'Z3', 2, 0, 0, 'na', 0, 2, '400.00', '850.00', '0.00', '550.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-05 22:16:44', '', '', 1),
(7, 'P00007', 'Led V3  H4', 3, 0, 0, 'na', 0, 5, '2200.00', '3000.00', '0.00', '2500.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-06 13:38:20', '', '', 1),
(8, 'P00008', 'Led c6', 3, 0, 0, 'na', 0, 5, '500.00', '1000.00', '0.00', '800.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-06 13:41:20', '', '', 1),
(9, 'P00009', 'Led Auto H4', 3, 0, 0, 'na', 0, 2, '3000.00', '5000.00', '0.00', '4500.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-06 13:42:41', '', '', 1),
(10, 'P00010', 'Nissan Extril Body Cover', 7, 0, 0, 'na', 0, 2, '1300.00', '2000.00', '0.00', '1800.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-06 19:40:11', '', '', 1),
(11, 'P00011', 'Daster Steel best', 8, 0, 0, 'na', 0, 50, '365.00', '400.00', '0.00', '380.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-06 19:59:02', '', '', 1),
(12, 'P00012', 'Led v8 h4', 3, 0, 0, 'na', 0, 10, '2000.00', '2500.00', '0.00', '2200.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-06-07 18:43:22', '', '', 1),
(13, 'P00013', 'Car 111', 1, 0, 0, 'na', 0, 0, '2000.00', '1200.00', '0.00', '1100.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-12 10:16:33', '', '', 1),
(14, 'P00014', 'Rabar Flex - White', 6, 0, 0, 'na', 0, 10, '70.00', '72.00', '0.00', '72.00', '', 'false', 4, '0', '', 'a', 'Admin', '2022-06-12 17:06:56', '', '', 1),
(15, 'P00015', 'Rabar Flex - Black', 6, 0, 0, 'na', 0, 10, '65.00', '70.00', '0.00', '70.00', '', 'false', 4, '0', '', 'a', 'Admin', '2022-06-12 17:07:31', '', '', 1),
(16, 'P00016', 'DXB To Dhaka ', 9, 0, 0, 'na', 0, 0, '0.00', '1350.00', '0.00', '0.00', '', 'true', 1, '0', '', 'a', 'Admin', '2022-06-22 17:01:43', '', '', 1),
(17, 'P00017', 'rak Comod', 11, 0, 0, 'na', 0, 5, '6618101.00', '1500000000.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-23 14:13:10', 'Admin', '2022-07-24 19:04:56', 1),
(18, 'P00018', 'printer service', 1, 0, 0, 'na', 0, 0, '0.00', '500.00', '0.00', '0.00', '', 'true', 1, '0', '', 'a', 'Admin', '2022-06-23 15:55:54', '', '', 1),
(19, 'P00019', 'Cricket', 9, 0, 0, 'na', 0, 20, '100.00', '120.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-25 15:41:49', '', '', 1),
(20, 'P00020', 'demai 22*35 180gsm', 12, 0, 0, 'na', 0, 5000, '107.50', '300.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-26 12:27:25', '', '', 1),
(21, 'P00021', 'Xyz', 9, 0, 0, 'na', 0, 20, '200.00', '250.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-26 18:48:04', '', '', 4),
(22, 'P00022', '32 \" Led Tv ', 13, 0, 0, 'na', 0, 0, '5700.00', '6000.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-28 13:43:37', '', '', 1),
(23, 'P00023', 'dhaka', 4, 0, 0, 'na', 0, 1, '1200.00', '1500.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-06-29 14:48:26', '', '', 3),
(24, 'P00024', 'zxc', 21, 0, 0, 'na', 0, 100, '205.26', '300.00', '0.00', '250.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-18 11:29:14', '', '', 1),
(25, 'P00025', 'Phone', 21, 0, 0, 'na', 0, 2, '20.00', '30.00', '0.00', '25.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-19 10:08:38', '', '', 1),
(26, 'P00026', 'my one tv', 3, 0, 0, 'na', 0, 0, '0.00', '115.00', '0.00', '115.00', '', 'true', 1, '0', '', 'a', 'Admin', '2022-07-22 21:25:50', '', '', 1),
(27, 'P00027', 'hed phone', 22, 0, 0, 'na', 0, 2, '20.00', '25.00', '0.00', '25.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-22 21:46:56', '', '', 1),
(28, 'P00028', 'potato', 24, 0, 0, 'na', 0, 2, '0.00', '10.00', '0.00', '0.00', '', 'true', 1, '0', '', 'a', 'Admin', '2022-07-22 23:36:23', 'Admin', '2022-08-18 14:10:39', 1),
(29, 'P00029', 'Rak  Morning comod', 26, 0, 0, 'na', 0, 5, '0.00', '1500.00', '0.00', '0.00', '', 'false', 1, '0', '', 'd', 'Admin', '2022-07-24 10:47:21', 'Admin', '2022-07-24 11:01:57', 6),
(30, 'P00030', 'Gawa Ghee 100gm', 27, 0, 0, 'na', 0, 2, '136.00', '150.00', '0.00', '150.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-24 22:46:04', 'Admin', '2022-07-24 22:54:00', 1),
(31, 'P00031', 'Airfreshner 300ml', 28, 0, 0, 'na', 0, 2, '135.00', '150.00', '0.00', '150.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-24 22:52:24', '', '', 1),
(32, 'P00032', '1561154', 2, 0, 0, 'na', 0, 0, '20.00', '25.00', '0.00', '25.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-07-26 22:43:15', '', '', 1),
(33, 'P00033', 'Pajamas 100% Cotton', 29, 0, 0, 'na', 4.5, 20, '400.00', '650.00', '0.00', '650.00', '', 'false', 2, '0', '', 'a', 'Admin', '2022-07-31 17:56:47', 'Admin', '2022-08-16 20:59:01', 1),
(34, 'P00034', 'Tube Light Fuxture-101/124 w', 30, 0, 0, 'na', 10, 10, '1448.28', '1300.00', '0.00', '1250.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-08-10 12:37:16', 'Admin', '2022-08-16 20:59:21', 1),
(35, 'P00035', '102/40w', 30, 0, 0, 'na', 0, 0, '1300.00', '1500.00', '0.00', '1450.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-08-10 12:38:38', '', '', 1),
(36, 'P00036', 'Shari 1 pes', 9, 0, 0, 'na', 0, 10, '100.00', '200.00', '0.00', '1500.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-08-14 16:50:33', '', '', 1),
(37, 'P00037', 'Komla', 32, 0, 0, 'na', 0, 2, '34.69', '35.00', '0.00', '0.00', '', 'false', 1, '0', '', 'a', 'Admin', '2022-08-17 23:22:31', '', '', 1),
(38, 'P00038', 'llll', 32, 0, 0, 'na', 0, 1, '20.00', '30.00', '0.00', '0.00', '', 'false', 1, '24', 'Carton', 'a', 'Admin', '2022-08-17 23:30:24', 'Admin', '2022-12-17 19:08:57', 1),
(39, 'P00039', 'TV', 13, 0, 0, 'na', 0, 0, '50.00', '20.00', '0.00', '15.00', '', 'false', 2, '16', 'Box', 'a', 'Admin', '2022-08-26 09:22:48', 'Admin', '2022-12-17 19:08:45', 1),
(40, 'P00040', '123456', 34, 0, 0, 'na', 0, 25, '30.00', '30.00', '0.00', '0.00', '', 'false', 1, '12', 'Dozon', 'a', 'Admin', '2022-08-27 19:04:44', 'Admin', '2022-12-17 18:20:35', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Car Sent', '', 'a', 'Admin', '2022-06-05 21:44:08', '', '', 1),
(2, 'Horn', '', 'a', 'Admin', '2022-06-05 22:10:37', '', '', 1),
(3, 'Led Bulb', '', 'a', 'Admin', '2022-06-06 13:33:09', '', '', 1),
(4, 'Hid Bulb', '', 'a', 'Admin', '2022-06-06 13:33:27', '', '', 1),
(5, 'Polish', '', 'a', 'Admin', '2022-06-06 13:33:53', '', '', 1),
(6, 'Spray', '', 'a', 'Admin', '2022-06-06 13:34:20', '', '', 1),
(7, 'Car Body cover', '', 'a', 'Admin', '2022-06-06 18:27:35', '', '', 1),
(8, 'Daster ', '', 'a', 'Admin', '2022-06-06 19:57:55', '', '', 1),
(9, 'Ticket', '', 'a', 'Admin', '2022-06-22 17:00:37', '', '', 1),
(10, 'Visa ', '', 'a', 'Admin', '2022-06-22 17:00:46', '', '', 1),
(11, 'Sanitary', 'Sanitary', 'd', 'Admin', '2022-06-23 14:11:47', '', '', 1),
(12, 'Demai', '180gsm', 'd', 'Admin', '2022-06-26 01:49:21', '', '', 1),
(13, 'LED TV', '', 'a', 'Admin', '2022-06-28 13:42:55', '', '', 1),
(14, 'key ring', '', 'a', 'Admin', '2022-06-28 20:09:24', '', '', 1),
(15, 'Wheel Mat', '', 'a', 'Admin', '2022-06-28 20:10:06', '', '', 1),
(16, 'Staring Cover', '', 'a', 'Admin', '2022-06-28 20:10:28', '', '', 1),
(17, 'Seat Coution', '', 'a', 'Admin', '2022-06-28 20:12:03', '', '', 1),
(18, 'Break oil', '', 'a', 'Admin', '2022-06-28 20:13:24', '', '', 1),
(19, 'Power Stering Oil', '', 'a', 'Admin', '2022-06-28 20:13:46', '', '', 1),
(20, 'Octane Buster', '', 'a', 'Admin', '2022-06-28 20:14:03', '', '', 1),
(21, 'red', '', 'a', 'Admin', '2022-07-18 11:28:27', '', '', 1),
(22, 'sotota', '', 'a', 'Admin', '2022-07-22 21:18:44', '', '', 1),
(23, 'vitalac', '', 'a', 'Admin', '2022-07-22 21:40:29', '', '', 1),
(24, 'chips', '', 'a', 'Admin', '2022-07-22 23:32:14', '', '', 1),
(25, 'RICE', '', 'a', 'Admin', '2022-07-23 16:19:42', '', '', 1),
(26, 'Comod', '', 'a', 'Admin', '2022-07-24 10:46:25', '', '', 6),
(27, 'Agrivita', '', 'a', 'Admin', '2022-07-24 22:44:03', '', '', 1),
(28, 'Vita Can', '', 'a', 'Admin', '2022-07-24 22:46:39', '', '', 1),
(29, 'Pajamas', '', 'a', 'Admin', '2022-07-31 17:55:44', '', '', 1),
(30, 'Tube Light Fixture', '', 'a', 'Admin', '2022-08-10 12:32:18', '', '', 1),
(31, 'water', '', 'a', 'Admin', '2022-08-16 18:16:07', '', '', 1),
(32, 'ggoo', '', 'a', 'Admin', '2022-08-17 23:21:29', '', '', 1),
(33, 'Baby food', 'Pempars, baby wips', 'a', 'Admin', '2022-08-22 01:45:33', '', '', 1),
(34, '456', '', 'a', 'Admin', '2022-08-27 19:01:02', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productions`
--

CREATE TABLE `tbl_productions` (
  `production_id` int(11) NOT NULL,
  `production_sl` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `incharge_id` int(11) DEFAULT NULL,
  `shift` varchar(250) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `labour_cost` float NOT NULL,
  `material_cost` float NOT NULL,
  `other_cost` float NOT NULL,
  `total_cost` float NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_productions`
--

INSERT INTO `tbl_productions` (`production_id`, `production_sl`, `date`, `incharge_id`, `shift`, `note`, `labour_cost`, `material_cost`, `other_cost`, `total_cost`, `status`, `branch_id`) VALUES
(1, 'PR-0001', '2022-03-22', 1, 'Day Shift', '', 200000, 145300, 50000, 395300, 'a', 1),
(2, 'PR-0002', '2022-12-18', 1, 'Day Shift', '', 0, 500, 0, 500, 'd', 1),
(3, 'PR-0003', '2022-12-18', 1, 'Day Shift', '', 0, 500, 0, 500, 'd', 1),
(4, 'PR-0004', '2022-12-18', 1, 'Day Shift', '', 0, 500, 0, 500, 'd', 1),
(5, 'PR-0005', '2022-12-18', 1, 'Day Shift', '', 0, 105, 0, 105, 'a', 1),
(6, 'PR-0006', '2022-12-18', 1, 'Day Shift', '', 0, 820, 0, 820, 'a', 1),
(7, 'PR-0007', '2022-12-18', 1, 'Day Shift', '', 0, 420, 0, 420, 'a', 1),
(8, 'PR-0008', '2022-12-18', 1, 'Day Shift', '', 0, 500, 0, 500, 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_details`
--

CREATE TABLE `tbl_production_details` (
  `production_details_id` int(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` float NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_production_details`
--

INSERT INTO `tbl_production_details` (`production_details_id`, `production_id`, `material_id`, `quantity`, `purchase_rate`, `total`, `status`, `branch_id`) VALUES
(1, 1, 7, 1000, 110, '110000.00', 'a', 1),
(2, 1, 8, 5, 60, '300.00', 'a', 1),
(3, 1, 9, 3000, 5, '15000.00', 'a', 1),
(4, 1, 5, 1000, 20, '20000.00', 'a', 1),
(5, 2, 9, 100, 5, '500.00', 'd', 1),
(6, 3, 9, 100, 5, '500.00', 'd', 1),
(7, 4, 9, 100, 5, '500.00', 'd', 1),
(9, 5, 11, 1, 100, '100.00', 'a', 1),
(10, 5, 9, 1, 5, '5.00', 'a', 1),
(11, 6, 4, 10, 82, '820.00', 'a', 1),
(16, 8, 12, 10, 50, '500.00', 'a', 1),
(15, 7, 1, 10, 42, '420.00', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_products`
--

CREATE TABLE `tbl_production_products` (
  `production_products_id` int(11) NOT NULL,
  `production_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(10) NOT NULL DEFAULT 'a',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_production_products`
--

INSERT INTO `tbl_production_products` (`production_products_id`, `production_id`, `product_id`, `quantity`, `price`, `total`, `status`, `branch_id`) VALUES
(1, 1, 9, 1000, '536.47', '536470.00', 'a', 1),
(2, 2, 40, 100, '30.00', '3000.00', 'd', 1),
(3, 3, 38, 100, '20.00', '2000.00', 'd', 1),
(4, 4, 38, 100, '20.00', '2000.00', 'd', 1),
(6, 6, 40, 50, '30.00', '1500.00', 'a', 1),
(8, 7, 40, 20, '30.00', '600.00', 'a', 0),
(9, 8, 33, 10, '400.00', '4000.00', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

CREATE TABLE `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `PurchaseDetails_TotalQuantity` float NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_purchasedetails`
--

INSERT INTO `tbl_purchasedetails` (`PurchaseDetails_SlNo`, `PurchaseMaster_IDNo`, `Product_IDNo`, `PurchaseDetails_TotalQuantity`, `PurchaseDetails_Rate`, `purchase_cost`, `PurchaseDetails_Discount`, `PurchaseDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseDetails_branchID`) VALUES
(1, 1, 40, 100, '30.00', '0.00', '0.00', '3000.00', 'a', 'Admin', '2022-11-26 17:43:47', NULL, NULL, 1),
(2, 1, 37, 10, '34.69', '0.00', '0.00', '346.90', 'a', 'Admin', '2022-11-26 17:43:47', NULL, NULL, 1),
(3, 1, 35, 100, '1300.00', '0.00', '0.00', '130000.00', 'a', 'Admin', '2022-11-26 17:43:47', NULL, NULL, 1),
(4, 2, 40, 10, '30.00', '0.00', '0.00', '300.00', 'a', 'Admin', '2022-11-26 17:44:14', NULL, NULL, 13),
(5, 2, 37, 10, '34.69', '0.00', '0.00', '346.90', 'a', 'Admin', '2022-11-26 17:44:14', NULL, NULL, 13),
(6, 3, 40, 100, '30.00', '0.00', '0.00', '3000.00', 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(7, 3, 39, 100, '50.00', '0.00', '0.00', '5000.00', 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(8, 3, 38, 100, '20.00', '0.00', '0.00', '2000.00', 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(9, 3, 37, 100, '34.69', '0.00', '0.00', '3469.00', 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(10, 3, 36, 100, '100.00', '0.00', '0.00', '10000.00', 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(12, 4, 40, 17, '30.00', '0.00', '0.00', '510.00', 'a', NULL, NULL, 'Admin', '2022-12-17 20:09:43', 1),
(13, 5, 40, 1, '30.00', '0.00', '0.00', '30.00', 'a', 'Admin', '2022-12-18 13:20:55', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

CREATE TABLE `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL,
  `Supplier_SlNo` int(11) NOT NULL,
  `Employee_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_purchasemaster`
--

INSERT INTO `tbl_purchasemaster` (`PurchaseMaster_SlNo`, `Supplier_SlNo`, `Employee_SlNo`, `PurchaseMaster_InvoiceNo`, `PurchaseMaster_OrderDate`, `PurchaseMaster_PurchaseFor`, `PurchaseMaster_Description`, `PurchaseMaster_TotalAmount`, `PurchaseMaster_DiscountAmount`, `PurchaseMaster_Tax`, `PurchaseMaster_Freight`, `PurchaseMaster_SubTotalAmount`, `PurchaseMaster_PaidAmount`, `PurchaseMaster_DueAmount`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseMaster_BranchID`) VALUES
(1, 1, 0, '2022000001', '2022-11-26', '1', '', '133346.90', '0.00', '0.00', '0.00', '133346.90', '0.00', '133346.90', 0, 'a', 'Admin', '2022-11-26 17:43:47', NULL, NULL, 1),
(2, 1, 0, '2022000002', '2022-11-26', '1', '', '646.90', '0.00', '0.00', '0.00', '646.90', '0.00', '646.90', 133347, 'a', 'Admin', '2022-11-26 17:44:14', NULL, NULL, 1),
(3, 2, 0, '2022000003', '2022-12-15', '14', '', '23469.00', '0.00', '0.00', '0.00', '23469.00', '20000.00', '3469.00', 0, 'a', 'Admin', '2022-12-15 21:30:44', NULL, NULL, 14),
(4, 1, 0, '2022000004', '2022-12-17', '1', '', '510.00', '0.00', '0.00', '0.00', '510.00', '0.00', '510.00', 133994, 'a', 'Admin', '2022-12-17 19:53:57', 'Admin', '2022-12-17 20:09:43', 1),
(5, 1, 0, '2022000005', '2022-12-18', '1', '', '30.00', '0.00', '0.00', '0.00', '30.00', '0.00', '30.00', 134504, 'a', 'Admin', '2022-12-18 13:20:55', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

CREATE TABLE `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `Supplier_IDdNo` int(11) NOT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

CREATE TABLE `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` float NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

CREATE TABLE `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` text NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

CREATE TABLE `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

CREATE TABLE `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 35, 10, '1300.00', '1500.00', '30.00', NULL, '0.00', '14700.00', 'a', 'Admin', '2022-11-26 17:48:06', NULL, NULL, 1),
(2, 1, 40, 10, '30.00', '30.00', '3.00', NULL, '0.00', '270.00', 'a', 'Admin', '2022-11-26 17:48:06', NULL, NULL, 1),
(3, 2, 40, 10, '30.00', '30.00', '0.00', NULL, '0.00', '300.00', 'a', 'Admin', '2022-12-15 21:34:30', NULL, NULL, 1),
(4, 3, 37, 5, '34.69', '35.00', '0.00', NULL, '0.00', '175.00', 'p', 'Admin', '2022-12-17 11:45:18', NULL, NULL, 1),
(5, 3, 40, 5, '30.00', '30.00', '0.00', NULL, '0.00', '150.00', 'p', 'Admin', '2022-12-17 11:45:18', NULL, NULL, 1),
(6, 4, 40, 15, '30.00', '30.00', '0.00', NULL, '0.00', '450.00', 'p', 'Admin', '2022-12-17 20:38:42', NULL, NULL, 1),
(7, 5, 40, 1, '30.00', '30.00', '0.00', NULL, '0.00', '30.00', 'p', 'Admin', '2022-12-18 13:19:54', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

CREATE TABLE `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

CREATE TABLE `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` float NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

CREATE TABLE `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) DEFAULT 0.00,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Previous_Due` double(18,2) DEFAULT NULL,
  `shipping_cus_name` varchar(100) DEFAULT NULL,
  `shipping_mobile` varchar(20) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `employee_id`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `SaleMaster_TotalSaleAmount`, `SaleMaster_TotalDiscountAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_SubTotalAmount`, `SaleMaster_PaidAmount`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `shipping_cus_name`, `shipping_mobile`, `shipping_address`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, '2201400001', 1, 1, '2022-11-26', '', 'retail', 'Cash', '14970.00', '0.00', '0.00', '0.00', '14970.00', '0.00', '14970.00', 0.00, NULL, NULL, NULL, 'a', 'false', 'Admin', '2022-11-26 17:48:06', NULL, NULL, 1),
(2, '2201400002', 2, 0, '2022-12-15', '', 'retail', 'Cash', '300.00', '0.00', '0.00', '0.00', '300.00', '0.00', '300.00', 0.00, 'Md Sohel Rana', '01721850242', 'Dhaka', 'a', 'false', 'Admin', '2022-12-16 11:44:30', NULL, NULL, 1),
(3, '220100003', 1, 0, '2022-12-17', '', 'retail', 'Cash', '325.00', '0.00', '0.00', '0.00', '325.00', '300.00', '25.00', 12600.00, 'Zac', '011425654', 'Dhaka', 'p', 'false', 'Admin', '2022-12-17 11:45:18', NULL, NULL, 1),
(4, '220100004', 1, 1, '2022-12-17', '', 'retail', 'Cash', '450.00', '0.00', '0.00', '0.00', '450.00', '0.00', '450.00', 12000.00, 'Zac', '011425654', 'Dhaka', 'p', 'false', 'Admin', '2022-12-17 20:38:42', NULL, NULL, 1),
(5, '220100005', 1, 0, '2022-12-18', '', 'retail', 'Cash', '30.00', '0.00', '0.00', '0.00', '30.00', '10.00', '20.00', 12000.00, 'Zac', '011425654', 'Dhaka', 'p', 'false', 'Admin', '2022-12-18 13:19:54', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shifts`
--

CREATE TABLE `tbl_shifts` (
  `shift_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_shifts`
--

INSERT INTO `tbl_shifts` (`shift_id`, `name`) VALUES
(1, 'Day Shift');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

CREATE TABLE `tbl_sms` (
  `row_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_sms`
--

INSERT INTO `tbl_sms` (`row_id`, `number`, `sms_text`, `sent_by`, `sent_datetime`) VALUES
(1, '01758479063', 'Test', 1, '2022-08-26 09:20:14'),
(2, '01758479063', 'Test', 1, '2022-08-26 09:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `sms_enabled` varchar(50) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) DEFAULT NULL,
  `sms_type` varchar(50) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `bulk_url` varchar(1000) DEFAULT NULL,
  `url_2` varchar(1000) DEFAULT NULL,
  `bulk_url_2` varchar(1000) DEFAULT NULL,
  `sender_id` varchar(200) DEFAULT NULL,
  `sender_id_2` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`sms_enabled`, `api_key`, `sms_type`, `url`, `bulk_url`, `url_2`, `bulk_url_2`, `sender_id`, `sender_id_2`, `user_id`, `password`, `country_code`, `sender_name`, `sender_phone`) VALUES
('gateway2', 'C2003631601c03803cde57.82758523', 'unicode', 'http://esms.linktechbd.com/smsapi', 'http://esms.linktechbd.com/smsapimany', 'http://mshastra.com/sendurl.aspx', 'http://mshastra.com/sendurlcomma.aspx', 'Link-UpTech', 'BigTech Ltd', '20102047', 'BTL@432', '+880', 'Link-Up Technology', '01911-978897');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'Shuvo', '', '', '01714562564', '', '', 'Dhaka', '', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-11-26 17:42:50', NULL, NULL, 1),
(2, 'S00002', 'Link Up', '', '', '01984714621', '', '', 'Dhaka, Mirpur', 'Link Up Technology', 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-12-15 21:29:57', NULL, NULL, 14),
(3, 'S00003', '', 'G', '', '', '', '', '', NULL, 0, 0, '', '0.00', NULL, 'a', 'Admin', '2022-12-18 14:53:26', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

CREATE TABLE `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

CREATE TABLE `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transferdetails`
--

INSERT INTO `tbl_transferdetails` (`transferdetails_id`, `transfer_id`, `product_id`, `quantity`, `purchase_rate`, `total`) VALUES
(1, 1, 40, 10, '30.00', '300.00'),
(2, 1, 37, 9, '34.69', '312.21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

CREATE TABLE `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) DEFAULT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transfermaster`
--

INSERT INTO `tbl_transfermaster` (`transfer_id`, `transfer_date`, `transfer_by`, `transfer_from`, `transfer_to`, `total_amount`, `note`, `added_by`, `added_datetime`, `updated_by`, `updated_datetime`) VALUES
(1, '2022-11-26', NULL, 13, 1, '612.21', '', 5, '2022-11-26 17:51:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'PCS', 'a', NULL, NULL, NULL, NULL),
(2, 'SET', 'a', 'Admin', '2022-06-05 22:13:12', NULL, NULL),
(3, 'Box ', 'a', 'Admin', '2022-06-12 10:21:50', NULL, NULL),
(4, 'Lbs', 'a', 'Admin', '2022-06-12 17:05:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `User_SlNo` int(11) NOT NULL,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, 'U0001', 'Admin', 'admin', 'admin@host.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'm', 'a', 1, '1.png', NULL, NULL, NULL, NULL, 1),
(6, '', 'User', 'user', 'user@gmail.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'u', 'a', 0, NULL, NULL, '2022-12-17 11:51:26', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 5, '[\"product_transfer\",\"transfer_list\",\"received_list\"]', 1, '2022-11-26 11:51:04'),
(2, 6, '[\"sales\\/product\",\"sales\\/service\",\"salesReturn\",\"salesrecord\",\"currentStock\",\"quotation\",\"cashTransaction\",\"bank_transactions\",\"customerPaymentPage\",\"supplierPayment\",\"cash_view\",\"account\",\"bank_accounts\",\"check\\/entry\",\"check\\/list\",\"check\\/reminder\\/list\",\"check\\/pending\\/list\",\"check\\/dis\\/list\",\"check\\/paid\\/list\",\"salesinvoice\",\"returnList\",\"sale_return_details\",\"customerDue\",\"customerPaymentReport\",\"customer_payment_history\",\"customerlist\",\"price_list\",\"quotation_invoice_report\",\"quotation_record\",\"TransactionReport\",\"bank_transaction_report\",\"cash_ledger\",\"bank_ledger\",\"cashStatment\",\"balance_sheet\",\"BalanceSheet\",\"profitLoss\",\"day_book\",\"purchase\",\"purchaseReturns\",\"purchaseRecord\",\"AssetsEntry\",\"salary_payment\",\"employee\",\"emplists\\/all\",\"emplists\\/active\",\"emplists\\/deactive\",\"designation\",\"depertment\",\"month\",\"salary_payment_report\",\"loan_transactions\",\"loan_view\",\"loan_transaction_report\",\"loan_ledger\",\"loan_accounts\",\"investment_transactions\",\"investment_view\",\"investment_transaction_report\",\"investment_ledger\",\"investment_accounts\",\"assets_report\",\"purchaseInvoice\",\"supplierDue\",\"supplierPaymentReport\",\"supplierList\",\"returnsList\",\"purchase_return_details\",\"reorder_list\",\"sms\",\"product\",\"productlist\",\"product_ledger\",\"damageEntry\",\"damageList\",\"product_transfer\",\"transfer_list\",\"received_list\",\"customer\",\"supplier\",\"category\",\"unit\",\"area\",\"companyProfile\",\"user\",\"database_backup\",\"graph\"]', 1, '2022-12-17 05:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activity`
--

CREATE TABLE `tbl_user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_activity`
--

INSERT INTO `tbl_user_activity` (`id`, `user_id`, `ip_address`, `login_time`, `logout_time`, `status`, `branch_id`) VALUES
(1, 1, '::1', '2022-11-26 17:40:31', '2022-11-26 17:41:16', 'a', 1),
(2, 1, '::1', '2022-11-26 17:41:19', '2022-11-26 17:51:10', 'a', 1),
(3, 5, '::1', '2022-11-26 17:51:18', NULL, 'a', 13),
(4, 5, '::1', '2022-11-26 17:51:27', '2022-11-26 17:52:04', 'a', 13),
(5, 1, '::1', '2022-11-26 17:52:10', '2022-11-26 17:56:01', 'a', 1),
(6, 5, '::1', '2022-11-26 17:56:09', '2022-11-26 17:57:29', 'a', 13),
(7, 1, '::1', '2022-11-26 17:57:32', '2022-11-26 18:02:32', 'a', 1),
(8, 1, '::1', '2022-12-15 20:11:52', NULL, 'a', 1),
(9, 1, '::1', '2022-12-17 10:22:09', '2022-12-17 11:51:39', 'a', 1),
(10, 6, '::1', '2022-12-17 11:51:45', '2022-12-17 12:05:06', 'a', 1),
(11, 1, '::1', '2022-12-17 12:05:10', '2022-12-17 12:13:15', 'a', 1),
(12, 6, '::1', '2022-12-17 12:13:22', '2022-12-17 12:15:42', 'a', 1),
(13, 1, '::1', '2022-12-17 12:15:46', NULL, 'a', 1),
(14, 1, '::1', '2022-12-17 17:55:48', '2022-12-17 20:58:56', 'a', 1),
(15, 1, '::1', '2022-12-18 10:07:07', '2022-12-18 10:07:45', 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `as_date` (`as_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branchid` (`branchid`);

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_SiNo`),
  ADD KEY `ProductCategory_SlNo` (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `brand_branchid` (`brand_branchid`);

--
-- Indexes for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  ADD PRIMARY KEY (`brunch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  ADD PRIMARY KEY (`Tr_SlNo`),
  ADD KEY `Tr_SlNo` (`Tr_SlNo`),
  ADD KEY `Tr_Id` (`Tr_Id`),
  ADD KEY `Tr_date` (`Tr_date`),
  ADD KEY `Tr_Type` (`Tr_Type`),
  ADD KEY `Acc_SlID` (`Acc_SlID`),
  ADD KEY `status` (`status`),
  ADD KEY `Tr_branchid` (`Tr_branchid`);

--
-- Indexes for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `SM_id` (`SM_id`),
  ADD KEY `date` (`date`),
  ADD KEY `remid_date` (`remid_date`),
  ADD KEY `check_status` (`check_status`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_SiNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`Company_SlNo`),
  ADD KEY `Invoice_Type` (`Invoice_Type`),
  ADD KEY `print_type` (`print_type`),
  ADD KEY `company_BrunchId` (`company_BrunchId`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`Country_SlNo`),
  ADD KEY `Status` (`Status`);

--
-- Indexes for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transfer_from_quantity` (`transfer_from_quantity`),
  ADD KEY `transfer_to_quantity` (`transfer_to_quantity`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_SlNo`),
  ADD KEY `Customer_Code` (`Customer_Code`),
  ADD KEY `Customer_Mobile` (`Customer_Mobile`),
  ADD KEY `Customer_Type` (`Customer_Type`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `area_ID` (`area_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Customer_brunchid` (`Customer_brunchid`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`CPayment_id`),
  ADD KEY `CPayment_date` (`CPayment_date`),
  ADD KEY `CPayment_invoice` (`CPayment_invoice`),
  ADD KEY `CPayment_customerID` (`CPayment_customerID`),
  ADD KEY `CPayment_TransactionType` (`CPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `CPayment_brunchid` (`CPayment_brunchid`),
  ADD KEY `CPayment_status` (`CPayment_status`);

--
-- Indexes for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  ADD PRIMARY KEY (`Damage_SlNo`),
  ADD KEY `Damage_InvoiceNo` (`Damage_InvoiceNo`),
  ADD KEY `Damage_Date` (`Damage_Date`),
  ADD KEY `status` (`status`),
  ADD KEY `Damage_brunchid` (`Damage_brunchid`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`DamageDetails_SlNo`),
  ADD KEY `Damage_SlNo` (`Damage_SlNo`),
  ADD KEY `Product_SlNo` (`Product_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`Department_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`Designation_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`District_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`Employee_SlNo`),
  ADD KEY `Designation_ID` (`Designation_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Employee_brinchid` (`Employee_brinchid`);

--
-- Indexes for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_date` (`payment_date`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `status` (`status`),
  ADD KEY `paymentBranch_id` (`branch_id`),
  ADD KEY `saved_by` (`saved_by`);

--
-- Indexes for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `payment_id` (`payment_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `Acc_Code` (`Acc_Code`) USING BTREE;

--
-- Indexes for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE,
  ADD KEY `account_id` (`account_id`) USING BTREE;

--
-- Indexes for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `save_date` (`save_date`),
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_materialcategory`
--
ALTER TABLE `tbl_materialcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_damage`
--
ALTER TABLE `tbl_material_damage`
  ADD PRIMARY KEY (`damage_id`),
  ADD UNIQUE KEY `invoice` (`invoice`),
  ADD KEY `damage_date` (`damage_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_damage_details`
--
ALTER TABLE `tbl_material_damage_details`
  ADD PRIMARY KEY (`damage_details_id`),
  ADD KEY `damage_id` (`damage_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_purchase`
--
ALTER TABLE `tbl_material_purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `purchase_date` (`purchase_date`),
  ADD KEY `purchase_for` (`purchase_for`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_material_purchase_details`
--
ALTER TABLE `tbl_material_purchase_details`
  ADD PRIMARY KEY (`purchase_detail_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_month`
--
ALTER TABLE `tbl_month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`Product_SlNo`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`),
  ADD KEY `ProductCategory_ID` (`ProductCategory_ID`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Product_branchid` (`Product_branchid`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  ADD PRIMARY KEY (`production_id`),
  ADD UNIQUE KEY `production_sl` (`production_sl`),
  ADD KEY `date` (`date`),
  ADD KEY `incharge_id` (`incharge_id`),
  ADD KEY `shift` (`shift`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_production_details`
--
ALTER TABLE `tbl_production_details`
  ADD PRIMARY KEY (`production_details_id`),
  ADD KEY `production_id` (`production_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_production_products`
--
ALTER TABLE `tbl_production_products`
  ADD PRIMARY KEY (`production_products_id`),
  ADD KEY `production_id` (`production_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  ADD PRIMARY KEY (`PurchaseDetails_SlNo`),
  ADD KEY `PurchaseMaster_IDNo` (`PurchaseMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseDetails_branchID` (`PurchaseDetails_branchID`);

--
-- Indexes for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  ADD PRIMARY KEY (`PurchaseMaster_SlNo`),
  ADD KEY `Supplier_SlNo` (`Supplier_SlNo`),
  ADD KEY `Employee_SlNo` (`Employee_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `PurchaseMaster_OrderDate` (`PurchaseMaster_OrderDate`),
  ADD KEY `status` (`status`),
  ADD KEY `PurchaseMaster_BranchID` (`PurchaseMaster_BranchID`);

--
-- Indexes for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  ADD PRIMARY KEY (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `Supplier_IDdNo` (`Supplier_IDdNo`),
  ADD KEY `PurchaseReturn_ReturnDate` (`PurchaseReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturn_brunchID` (`PurchaseReturn_brunchID`);

--
-- Indexes for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  ADD PRIMARY KEY (`PurchaseReturnDetails_SlNo`),
  ADD KEY `PurchaseReturn_SlNo` (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseReturnDetailsProduct_SlNo` (`PurchaseReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturnDetails_brachid` (`PurchaseReturnDetails_brachid`);

--
-- Indexes for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  ADD PRIMARY KEY (`quotation_customer_id`),
  ADD KEY `quation_customer_branchid` (`quation_customer_branchid`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  ADD PRIMARY KEY (`SaleReturn_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleReturn_ReturnDate` (`SaleReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturn_brunchId` (`SaleReturn_brunchId`);

--
-- Indexes for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  ADD PRIMARY KEY (`SaleReturnDetails_SlNo`),
  ADD KEY `SaleReturn_IdNo` (`SaleReturn_IdNo`),
  ADD KEY `SaleReturnDetailsProduct_SlNo` (`SaleReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturnDetails_brunchID` (`SaleReturnDetails_brunchID`);

--
-- Indexes for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SalseCustomer_IDNo` (`SalseCustomer_IDNo`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_shifts`
--
ALTER TABLE `tbl_shifts`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`Supplier_SlNo`),
  ADD KEY `Supplier_Code` (`Supplier_Code`),
  ADD KEY `Supplier_Mobile` (`Supplier_Mobile`),
  ADD KEY `District_SlNo` (`District_SlNo`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Supplier_brinchid` (`Supplier_brinchid`);

--
-- Indexes for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  ADD PRIMARY KEY (`SPayment_id`),
  ADD KEY `SPayment_date` (`SPayment_date`),
  ADD KEY `SPayment_invoice` (`SPayment_invoice`),
  ADD KEY `SPayment_customerID` (`SPayment_customerID`),
  ADD KEY `SPayment_TransactionType` (`SPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `SPayment_brunchid` (`SPayment_brunchid`),
  ADD KEY `SPayment_status` (`SPayment_status`);

--
-- Indexes for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  ADD PRIMARY KEY (`transferdetails_id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transfer_date` (`transfer_date`),
  ADD KEY `transfer_from` (`transfer_from`),
  ADD KEY `transfer_to` (`transfer_to`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`Unit_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`User_SlNo`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `User_Name` (`User_Name`),
  ADD KEY `User_Password` (`User_Password`),
  ADD KEY `UserType` (`UserType`),
  ADD KEY `status` (`status`),
  ADD KEY `Brunch_ID` (`Brunch_ID`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  MODIFY `as_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  MODIFY `brunch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  MODIFY `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `CPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  MODIFY `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  MODIFY `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `District_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expense_head`
--
ALTER TABLE `tbl_expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_materialcategory`
--
ALTER TABLE `tbl_materialcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_materials`
--
ALTER TABLE `tbl_materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_material_damage`
--
ALTER TABLE `tbl_material_damage`
  MODIFY `damage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_material_damage_details`
--
ALTER TABLE `tbl_material_damage_details`
  MODIFY `damage_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_material_purchase`
--
ALTER TABLE `tbl_material_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_material_purchase_details`
--
ALTER TABLE `tbl_material_purchase_details`
  MODIFY `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_month`
--
ALTER TABLE `tbl_month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  MODIFY `production_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_production_details`
--
ALTER TABLE `tbl_production_details`
  MODIFY `production_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_production_products`
--
ALTER TABLE `tbl_production_products`
  MODIFY `production_products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  MODIFY `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  MODIFY `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  MODIFY `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  MODIFY `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  MODIFY `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  MODIFY `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  MODIFY `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_shifts`
--
ALTER TABLE `tbl_shifts`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  MODIFY `SPayment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  MODIFY `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `User_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
