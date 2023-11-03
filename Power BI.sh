1. Why it is showing blank in slicer visual
		the reason is source data is null.

2. Zero order: it is a design strategy which is used for arranging visuals over shape.

3. ALL: Returns all the rows in a table, or all the values in a column, ignroing any filters that might 
	have been applied.

4. Removefilters: clear fil FROM THE specified table or column.

5. X-velocity: it is the in-memory analytics engine behind
		power pivot that loads and handles huge data in power bi.
		It Stores data in columnar storage that results in faster prcessing.
		
6. Context Transition: when the row value become the column filter its called Context Transition.
	HAPPENS because of different ganualarity levels.
	
7. Query folding: It is the ability for a power query to generate single query statement that retrieves 
	and transforms source data.
	
8. ALLSELECTED: Returns all the rows in a table, or all the values in a 
	column, ignoring any filters that might have been applied inside the query, but keeping filters 
	that come from outside.

9. 	measure----->Store RAM---->Consume CPU
	calculate---->Consume RAM.

10. Field Parameters: It allows users to dynamically change the measures (or) dimensions being analyzed 
					  within a report. This feature can help your report readers explore and customize
					  the analysis of the report by selecting the different measures or dimensions 
					  they are interested in.
					  enable Field Parameters-----> options & Settings--------> Global----->
					  field Parameters
					  Modelling--------->fields---->name---->add and reorder fields-----> 
					  it create a table---->field----->add table.
					  
11. what if	Parameters: 
						Basically there are 2 types of Parameters in Power bi
						1. Power Query Parameters
						2. What if Parameters
						what if Parameters in power BI can easily gives the ability to dynamically 
						transforms your data
						mainly its used for scenario base testing and analysis.
						table_name
						EMIsimulator=generateseries(1,10,1)
						EMIsimulator value=selectedvalue(table_name[EMIsimulator])
						create explicit measure=sum(loan)
						emi amount=sum(loan)*table_name[EMIsimulator value]/100
12. Import vs Direct Query vs Live Connection:
	import query:
			data stores into power bi
			most transformation like merge etc.
			Full Dax expression support.
		Advantages:
			best performance 
			full featured 
			ideal for most of data sources like databases, spreadsheets etc with limited data size.
	Direct Query:
			data reside in source database.
			limited power query function
			limited transformations
			Direct Connections to data source. load on gateways.
			only report and modelview
		Advantages:
			better option for database with large data sets.
			near rel-time data
			no data size limit.
	Live Connection:
			data reside in source database.
			just visualization.
			perfect for prebuilt models like analysis services, Cubes etc.
			no transformations, only report level measures.
			model reside in source(no dataset)
			report level measures.
			no power Query
			cannot combine multiple data sources
		Advantages:
			quick to start development
			support complex business logics
			no data size limit.
13. workspace is a environment where publish the reports.
			dev, test, deployment.

14. free, pro and premium

15. Data refresh everyhour using pro?
	no, but we can achieve this schedule refresh based on dataset refresh.
	
16. can we send automatics email based on a condtion?
	yes, we can automated alert to our users and for that what we need to do is we nwee to create an 
	automated alert	using power platform and for that we need to create a dashboard in power bi service 
	for that particular report alert can be used on card, kpi, guage chart.
				
17. Data flows
				reusable flows.
				
18. Most challenging project which you worked on.
	yes, i guess the report that i have creatad in previous project was most challenging in that
	project create complex measures in a customizes matrix that was very challenging for me and i had
	to plot a no. of measures in waterfall chart so that particular was quite challenging for me.
	

19. Steps to Calculate Business Days
# Method1: Create a Measure for Working Days
	Working Days =
	VAR _StartDate = SELECTEDVALUE(MyTable[Start Date])
	VAR _EndDate = SELECTEDVALUE(MyTable[End Date])
	RETURN
	NETWORKDAYS(_StartDate, _EndDate, 1, Holiday)

#Method2: 
	Workdays = 
	COUNTROWS (
		FILTER (
			ADDCOLUMNS (
				CALENDAR ( 'Sheet1 (2)'[StartDate], 'Sheet1 (2)'[EndDate] ),
				"Day of Week", WEEKDAY ( [Date], 2 )
			),
			[Day of Week] <> 6 && [Day of Week] <> 7
		)
	)
#Method3: 
	Sales happening Only on weekdays
	Total sales on weekdays= 
	var weekdays =filter(Table_Name, Table_Name[Day of Week] <> 6 && Table_Name[Day of Week] <> 7)
	return sumx(weekdays, sum(orders[revenue]))
	
#excel, access tool to store data not scalable

20. #FIND: is case-sensitive
	Return value

	EVALUATE
	CALCULATETABLE (
		ADDCOLUMNS (
			TOPN ( 10, SUMMARIZE('Reseller', [Reseller], [Business Type])),
			"Position of Bike", FIND ( "Bike", 'Reseller'[Reseller], 1, BLANK () )
		),
		'Reseller'[Business Type] IN { "Specialty Bike Shop", "Value Added Reseller", "Warehouse"}
	)

21. #SEARCH is case-InSensitive.
	EVALUATE
	CALCULATETABLE (
		ADDCOLUMNS (
			TOPN ( 10, SUMMARIZE('Reseller', [Reseller], [Business Type])),
			"Position of cycle", SEARCH ( "cycle", 'Reseller'[Reseller], 1, BLANK () )
		),
		'Reseller'[Business Type] IN { "Specialty Bike Shop", "Value Added Reseller", "Warehouse"}
	)
	FIND or SEARCH part of a string in a column:
	Return value.
	
	#summary: FIND does not support wildcard characters, while SEARCH does.
22. The GROUPBY function is similar to the SUMMARIZE function. However, GROUPBY does not do an implicit 
	CALCULATE for any extension columns that it adds. GROUPBY permits a new function, CURRENTGROUP, 
	to be used inside aggregation functions in the extension columns that it adds.
	Another difference between SUMMARIZE and SUMMARIZECOLUMNS is that SUMMARIZE keeps both a row 
	context and a filter context active in the expression where you specify the aggregation 
	(more details in All the secrets of SUMMARIZE), whereas SUMMARIZECOLUMNS provides a filter 
	context only and no row context. with the Power BI cross-report drillthrough feature, you can 
	contextually jump from one report to another report in the same Power BI service workspace or app.

23. Difference b/w calendar and calendarauto? 
	CALENDAR: Returns a table with one column of all dates between StartDate and EndDate.
	CALENDARAUTO: Returns a table with one column of dates calculated from the model automatically. 
                                         
24)	Difference b/w SUM and SUMX? Difference b/w SUM and SUMX:
	Sum is filter level context
	Sumx is row level context
	
25) What is the IF function? 
	IF is a logical function that takes 3 parameters.
		=IF(condition,”yes”,”no”)
		
26) Difference b/w New Measure and New column? 
	Measure									Column
	Dynamic calculations					Predefined calculation
	CPU processing							CPU memory
	Measure result can see only in visual	Columns results can in data tab
	Filter level context					Column is row level context
	
27) Difference b/w & and && operators? 
	The && operator is purely a Logical operator. The basic difference between the & and &&  
	operator is that the & operator is text operator. 
	of the expression whereas, the && operator evaluates only the left-hand side of the 
	expression to obtain the final result.
	
28) What is the difference b/w calculate and calculate table functions?
	CALCULATE: Evaluates an expression in a context modified by filters.
	CALCULATETABLE: Evaluates a table expression in a context modified by filters.
 
29) Difference b/w All and All except functions? 
	Like all the functions of the ALL* family, ALLEXCEPT can offer two different behaviours: 
	it can be used as a table function, or as a CALCULATE modifier. 
	ALLEXCEPT is seldom used as a table function. ALLEXCEPT is mostly used along with  CALCULATE to 
	remove all filters from a table, except for some columns.

30) Difference b/w Look up value function and related function? 
	Both RELATED and LOOKUPVALUE are DAX functions that are used in a calculated column when you 
	need to reference a column from another table to return a value that is related and has an exact
	match to the current row. RELATED and LOOKUPVALUE are working similarly to the LOOKUP function in
	Excel.

31) How to make an inactive relationship active? 
	=Calculate(sum(col_name),userrelation(col1,col2))

32) How to find current year sales and previous year sales Time intelligence functions in Power BI. 	
	= Calculate(sum(coulm_name),sameperiodLastYear(date_col))

33) Can you please tell what DAX functions you worked on? 

34) What is YTD? Time intelligence functions in Power BI 

35) Basic syntax of DAX formula? Basic syntax of DAX formula 
	A DAX formula always starts with an equal sign (=). After the equals sign, 
	you can provide any expression that evaluates to a scalar, or an expression that can be converted
	to a scalar.

36) What is the summarize function in DAX?
 
37) summarize vs summarizecolumns
	Both of these functions are used to create summarised tables.
	The difference between the two is that the SUMMARISE function allows us to have a row and a
	filter context within the expression whereas the SUMMARIZECOLUMNS function only allows us to
	have a filter context and no row context.

38) group by vs summarise 
	The GROUPBY function is similar to the SUMMARIZE function. However, GROUPBY does not do an
	implicit CALCULATE for any extension columns that it adds. GROUPBY permits a new function,
	CURRENTGROUP, to be used inside aggregation functions in the extension columns that it adds.

38) related vs relatedtable
	RELATED is one of the most commonly used DAX functions. You use RELATED when you are scanning a 
	table, and within that row context you want to access rows in related tables. RELATEDTABLE
	is the companion of RELATED, and it is used to traverse relationships in the opposite direction.

39) #Text Functions
	1)CONCATENATE
		This DAX function joins two text strings into one.

		Syntax
		CONCATENATE(<text1>, <text2>)

		Example
		=CONCATENATE("Hello ", "World")

	2)CONCATENATEX
		This DAX function the result of an expression evaluated for each row in a table.

		Syntax
		CONCATENATEX(<table>, <expression>, [delimiter])

		Example
		=CONCATENATEX(Employees, [FirstName] & “ “ & [LastName], “,”)

	3)FIXED
		This DAX function rounds a number to the specified number of decimals and returns the result
		as text.

		Syntax
		FIXED(<number>, <decimals>, <no_commas>)

		Example
		=FIXED([PctCost],3,1)

	4)REPLACE
		This DAX function replaces part of a text string, based on the number of characters you specify, with a different text string.

		Syntax
		REPLACE(<old_text>, <start_num>, <num_chars>, <new_text>)

		Example
		=REPLACE('New Products'[Product Code],1,2,"OB")

	5)SEARCH
		This DAX function returns the number of the characters at which a specific text string is first found.

		Syntax
		SEARCH(<find_text>, <within_text>[, [<start_num>][, <NotFoundValue>]])

		Example
		=SEARCH("n","printer")

		The formula returns 4 because "n" is the fourth character in the word "printer."

	6)UPPER
		This DAX function returns a text string in all uppercase letters.

		Syntax
		UPPER (<text>)

		Example
		=UPPER(['New Products'[Product Code])
38). #Aggregate Functions
	1).MIN
		This DAX function returns the minimum numeric value in a column, or between two scalar expressions.

		Syntax
		MIN(<column>)

		Example
		=MIN([ResellerMargin])

	2).MINA
		This DAX function returns the minimum value in a column, including any logical values and
		numbers represented as text.

		Syntax
		MINA(<column>)

		Example
		=MINA(([PostalCode])

	3).MINX
		This DAX function returns the minimum numeric value that results from evaluating an expression
		for each row of a table.

		Syntax
		MINX(<table>, < expression evaluated for each row>)

		Example
		=MINX( FILTER(InternetSales, InternetSales[SalesTerritoryKey] = 5), InternetSales[Freight] +
		InternetSales[TaxAmt])  
		
	4). MAX
		This DAX function returns the maximum value in a column, including any logical values and
		numbers represented as text.

		Syntax
		MAX(<column>)

		Example
		=MAX([ResellerMargin])

	5).MAXA
		This DAX function returns the maximum value in a column, including any logical values and
		numbers represented as text.

		Syntax
		MAXA(<column>)

		Example
		=MAXA(([PostalCode])

	6). MAXX
		This DAX function returns the maximum numeric value that results from evaluating an expression
		for each row of a table.

		Syntax
		MAXX(<table>, < expression evaluated for each row>)

		Example
		=MAXX( FILTER(InternetSales, InternetSales[SalesTerritoryKey] = 5), InternetSales[Freight] +
		InternetSales[TaxAmt])  

	7).SUM
		This DAX function adds all the numbers in a column.

		Syntax
		SUM(<column>)

		Example
		=SUM(Sales[Amt])

	8).AVERAGE
		This DAX function returns the arithmetic mean of the values in a column.

		Syntax
		AVERAGE(<column>)

		Example
		=AVERAGE(InternetSales[ExtendedSalesAmount])

	9).SUMX
		This DAX function returns the sum of an expression evaluated for each row in a table.

		Syntax
		SUMX(<table>, <expression evaluated for each row>)

		Example
		=SUMX(FILTER(InternetSales, InternetSales[SalesTerritoryID]=5),[Freight])

	10).AVERAGEX
		This DAX function calculates the arithmetic mean of a set of expressions evaluated over a table.

		Syntax
		AVERAGEX(<table>, <expression evaluated for each row>)

		Example
		=AVERAGEX(InternetSales, InternetSales[Freight]+ InternetSales[TaxAmt])

39). #Count Functions
	1). DISTINCTCOUNT
		This is a DAX function used to return the distinct count of items in a column. So, 
		if there are multiple numbers of the same item,  this function will count it as a single item.

		Syntax
		DISTINCTCOUNT(<column>)

		Example
		=DISTINCTCOUNT(ResellerSales_USD[SalesOrderNumber])

	2). COUNT
		This is a DAX function used to return the count of items in a column. So, if there are 
		multiple numbers of the same item,  this function will count it as separate items and not a
		single item.

		Syntax
		COUNT(<column>)

		Examples
		=COUNT([ShipDate])

	3). COUNTA
		This is a DAX function used to return the count of items, in a column, that is not empty.

		Syntax
		COUNTA(<column>)

		Example
		=COUNTA('Reseller'[Phone])

	4). COUNTROWS
		This is a DAX function that counts the number of rows in the specified table, or in a table defined by an expression.

		Syntax
		COUNTROWS(<table>)

		Example
		=COUNTROWS('Orders')

	5). COUNTBLANK
		This is a DAX function that counts the number of blank cells in a column.

		Syntax
		COUNTBLANK(<column>)

		Example
		=COUNTBLANK(Reseller[BankName])

40). DATA TYPES
			Binary
			Boolean
			Currency
			DateTime
			Decimal
			Integer
			String
			Variant
			
41). OPERATORS
		Addition (+)
		And (&&)
		Concatenation (&)
		Division (/)
		Equal to (=)
		Exponentiation (^)
		Greater than (>)
		Greater than or equal to (>=)
		IN
		Less than (<)
		Less than or equal to (<=)
		Multiplication (*)
		NOT
		Not equal to (<>)
		Or (||)
		Strictly equal to (==)
		Subtraction (-)
		Table constructor { }
		
42). # Relationship functions

	Functions in this category are for managing and utilizing relationships between tables.

		Function				Description
	CROSSFILTER			Specifies the cross-filtering direction to be used in a calculation for a 
							relationship that exists between two columns.
	RELATED				Returns a related value from another table.
	RELATEDTABLE		Evaluates a table expression in a context modified by the given filters.
	USERELATIONSHIP		Specifies the relationship to be used in a specific calculation as the one 
						that exists between columnName1 and columnName2.

43). #New DAX functions

	DAX is continuously being improved with new functions and functionality to support new features. 
	New functions and updates are included in service, application, and tool updates which in most cases are monthly.

	While functions and functionality are being updated all the time, only those updates that have a visible and 
	functional change exposed to users are described in documentation. New functions and updates to existing functions 
	within the past year are shown here.

	Important

	Not all functions are supported in all versions of Power BI Desktop, Analysis Services, and Power Pivot in Excel. 
	New and updated functions are typically first introduced in Power BI Desktop, and then later in Analysis Services, 
	Power Pivot in Excel, and tools.

New functions
#Function				Month			Description
	RANK			April, 2023			Returns the ranking for the current context within the specified partition, sorted by the specified order.
	ROWNUMBER		April, 2023			Returns the unique ranking for the current context within the specified partition, sorted by the specified order.
	LINEST			February, 2023		Uses the Least Squares method to calculate a straight line that best fits the given data.
	LINESTX			February, 2023		Uses the Least Squares method to calculate a straight line that best fits the given data. The data result from expressions evaluated for each row in a table.
	INDEX			December, 2022		Returns a row at an absolute position, specified by the position parameter, within the specified partition, sorted by the specified order or on the specified axis.
	OFFSET			December, 2022		Returns a single row that is positioned either before or after the current row within the same table, by a given offset.
	ORDERBY			December, 2022		Defines the columns that determine the sort order within each of a WINDOW function’s partitions.
	PARTITIONBY		December, 2022		Defines the columns that are used to partition a WINDOW function’s <relation> parameter.
	WINDOW			December, 2022		Returns multiple rows which are positioned within the given interval.
	EVALUATEANDLOG	November, 2022		Returns the value of the first argument and logs it in a DAX Evaluation Log profiler event.
	TOCSV			November, 2022		Returns a table as a string in CSV format. This function applies to Power BI Desktop only.
	TOJSON			November, 2022		Returns a table as a string in JSON format. This function applies to Power BI Desktop only.
	NETWORKDAYS			July, 2022		Returns the number of whole workdays between two dates.

44). #Table manipulation functions 
		ADDCOLUMNS
		ADDMISSINGITEMS
		CROSSJOIN
		CURRENTGROUP
		DATATABLE
		DETAILROWS
		DISTINCT (column)
		DISTINCT (table)
		EXCEPT
		FILTERS
		GENERATE
		GENERATEALL
		GENERATESERIES
		GROUPBY
		IGNORE
		INTERSECT
		NATURALINNERJOIN
		NATURALLEFTOUTERJOIN
		ROLLUP
		ROLLUPADDISUBTOTAL
		ROLLUPGROUP
		ROLLUPISUBTOTAL
		ROW
		SELECTCOLUMNS
		SUBSTITUTEWITHINDEX
		SUMMARIZE
		SUMMARIZECOLUMNS
		Table constructor
		TOPN
		TREATAS
		UNION
		VALUES

46). Statistical Functions

	RANK functions
	Returns the ranking order.

	There are two types of rank functions.

	RANK.EQ(value,column,[order])
	RANKX(table,expresssion,[value],[order],[ties])
	The paramters in square brackets are optional.

	RANK
	Use when you want to find the rank of a specific value in a particular column.
	
47) Total Products USERELATIONSHIP =
	CALCULATE (
	   COUNT ( 'Product'[ProductID] ),
	   USERELATIONSHIP ( 'Product'[ProductID], Sales[ProductIDInactive] )
	)

48) Total Products CROSSFILTER =
	CALCULATE (
	   COUNT ( 'Product'[ProductID] ),
	   CROSSFILTER ( 'Product'[ProductID], Sales[ProductID], BOTH )
	)

49) We have found that using the USERELATIONSHIP instead 
	of CROSSFILTER can give us the same results with better performance. 
	
50) Cascading Filter :It allows a slicer to be filtered based on a measure, which means that 
	you no longer need to use bi-directional relationships.
	
51) ALM Toolkit is a free and open-source tool to manage Microsoft Power BI datasets: Database compare,
	Code merging, Easy deployment, Source-control integration, Reuse definitions, Self-service to 
	corporate BI.
	It is based on the source code of BISM Normalizer, which provides similar features for Tabular models.
52) TREATAS: It is Table Manipulation Function, A table that contains all the rows in column(s) 
				that are also in table_expression.
		CALCULATE(
	SUM(Sales[Amount]), 
	TREATAS(VALUES(DimProduct1[ProductCategory]), DimProduct2[ProductCategory])
	)

53) LOOKUPVALUE: It is Filter Manipulation Function
	Returns the value for the row that meets all criteria specified by one or more search conditions.
	CHANNEL = LOOKUPVALUE('Sales Order'[Channel],'Sales Order'[SalesOrderLineKey],[SalesOrderLineKey])
	it can be used as Measure or Calculated columns.
	it works without Relationship.
	it doesnt work Directquery and RLS.
	use related instead od LOOKUPVALUE for better performance.
	
54) RELATED:	It is realtionship function, Returns a related value from another table.
		= SUMX(FILTER( 'InternetSales_USD'  
            ,  RELATED('SalesTerritory'[SalesTerritoryCountry])  
               <>"United States" 
             )  
     ,'InternetSales_USD'[SalesAmount_USD])
55) RELATEDTABLE: Evaluates a table expression in a context modified by the given filters.
		= SUMX( RELATEDTABLE('InternetSales_USD')  
     , [SalesAmount_USD])

56) RELATED and RELATEDTABLE are two elementary but powerful functions. 
	The critical difference between them is that RELATED works on the “many-side “ of the relationship, 
	and RELATEDTABLE works on the “one-side” of the relationship.

57) DEFINE:

		Introduces a statement with one or more entity definitions that can be applied to one or more EVALUATE 
		statements of a DAX query.

		Syntax
		DAX

		Copy
		[DEFINE 
			(
			 (MEASURE <table name>[<measure name>] = <scalar expression>) | 
			 (VAR <var name> = <table or scalar expression>) |
			 (TABLE <table name> = <table expression>) | 
			 (COLUMN <table name>[<column name>] = <scalar expression>) | 
			) + 
		]

		(EVALUATE <table expression>) +

58) EVALUATE
		Introduces a statement containing a table expression required in a DAX query.

		Syntax
		DAX

		EVALUATE <table>  
59) The difference is that NULL is used to refer to nothing. 
	However, an empty string is used to point to a unique string with zero length.
	
60) In particular, null values must be distinguished from blank values: 
	A null database field means that there is no value for a given record. 
	It indicates the absence of a value. A blank database field means that there is a 
	value for a given record, and this value is empty (for a string value) or 0 (for a numeric value).1
61) #Conformed Dimension- 
	This is used in multiple locations. It helps in creating consistency so that 
	the same can be maintained across the fact tables. Different tables can use the table across the fact 
	table and it can help in creating different reports.

	For example, there are two fact tables. Fact table 1 is to determine the number of products sold by 
	geography. This table will calculate just the number of products by geography and fact table 2 will 
	determine the revenue generated by customer. Both are dependent on the product which contains product Id, name and source.

	There is the geography dimension and customer dimension which are being shared by two fact tables.
	The revenue fact gives the revenue generated by both the geography and the customer, while the product units fact gives number of units sold in the geography to a customer.

#Degenerate Dimension– 
	A degenerate dimension is when the dimension attribute is stored as part of 
	the fact table and not in a separate table. Product id comes from product dimension table. 
	Invoice number is a standalone attribute and has no other attributes associated with it. 
	An invoice number can be crucial since the business would want to know the quantity of the products.

#Junk Dimension– 
	It is a single table with a combination of different and unrelated attributes to 
	avoid having a large number of foreign keys in the fact table. They are often created to manage 
	the foreign keys created by rapidly changing dimensions.

#Role play dimension– 
	It is a table that has multiple valid relationships with a fact table. For 
	example, a fact table may include foreign keys for both ship date and delivery date. But the same 
	attributes apply to each foreign key so the same tables can be joined to the foreign keys.
61). Data Flow: It basically deals with the source, destination, and data transformations. 
	Control Flow: It majorly deals with containers and tasks. 
	Event Handler: It is responsible for sending messages, and events. 
	Package Explorer: It gives you a single view of all packages.

62) Types of Data Flow in Azure Data Factory
	There are two types of Data flows: 
		Mapping Data Flow. 
		Wrangling Data Flow.
63) The Integration Runtime (IR) is the compute infrastructure used by Azure Data Factory and 
	Azure Synapse pipelines to provide the following data integration capabilities across 
	different network environments: 
	Data Flow: Execute a Data Flow in a managed Azure compute environment.
	Integration runtime types
	Data Factory offers three types of Integration Runtime (IR), 
	and you should choose the type that best serves your data integration capabilities and network 
	environment requirements. 
		The three types of IR are:

		Azure
		Self-hosted
		Azure-SSIS

64) The Tab Order is a simple technique that allows users to more easily navigate across 
	our report using the keyboard shortcuts alone. On most reports the tab order usually 
	coded to reflect the page layout; that is top to bottom and left to right. This helps 
	sighted keyboard users get around the page.
	
65) Running Total Without Date
	product_ID 		Total_sales
	
	ranking = Rank(all('table 5'[product_ID], 'Table 5'[sales]),[Total_sales,, desc,Dense)
	cumu_Total = CALCULATE([Total_sale], Filter(ALL(table 5), 'table 5'[Ranking]<= 
	max('table 5'[Ranking])
	
66) How to FIX Incorrect Measure Totals in Power BI 
	category_name		total Orders
	
	correct_total = If(hasonevalue(product_categories[CataegoryName]), [Total Orders], 
	SUMX(product_categories, [Total Orders]))
	
67) DW Schema:
		1. Star Schema 
		2. Snowflake Schema
		3. Fact Constellation Schema
			Fact Constellation is a schema for representing multidimensional model. It is a collection of multiple fact tables having some common dimension tables. It can be viewed as a collection of several star schemas and hence, also known as Galaxy schema.
	Types of Fact tables
	summative 		semi summative		Non-addiive 
	
	1. Transaction Fact Table
	2. Periodic snapshot Fact Table
	3. Accumulated Fact Table
	
	Types of dimension Tables
	
	1. Slowly changing Dimension
			SCD 0 no change
			SCD 1 overwriting the old value
			SCD 2 creating new row
			SCD 3 adding new column
			SCD 4 using historical table(1+2)
			SCD 6	(1+2+3)hybrid SCD
		
	2. Conformed Dimension- 
		This is used in multiple locations. 
		It helps in creating consistency so that
		the same can be maintained across the 
		fact tables. Different tables can use 
		the table across the fact table and it 
		can help in creating different reports.
	3. Degenerate Dimension– 
		A degenerate dimension is when the dimension
		attribute is stored as part of the fact 
		table and not in a separate table. 
		Product id comes from product dimension 
		table. Invoice number is a standalone 
		attribute and has no other attributes 
		associated with it. An invoice number 
		can be crucial since the business would
		want to know the quantity of the products.
	4. Junk Dimension– It is a single table with a 
		combination of different and unrelated attributes to avoid having a large number of foreign keys in the fact table. They are often created to manage the foreign keys created by rapidly changing dimensions.

	5.	Role play dimension– It is a table that has multiple valid relationships with a fact table. For example, a fact table may include foreign keys for both ship date and delivery date. But the same attributes apply to each foreign key so the same tables can be joined to the foreign keys.

		Types of Keys in DW:
68). country		qty			value		hasonevalue
	hasonevalue= hasonevalue(sales[city])
	cal_value = if(hasonevalue(sales[city]),sum(sales[qty]))
	
69). #visuals on table level
	country   qty 		value
	 
	select column chart--->click outside page--->format--->tooltip(on)-->hide the page
	--->goto table page1--->format--->tooltip--->type(report page)-->page (tooltip)
	
70). select table 
		country		qty			value	
	select	bar	column 
		country_list=GENERATESERIES(1,DISTINCTCOUNT(sales[country]),1)
			slice--->add value
			rankvalue=rankx(ALL(sales), calculate(sum(sales[value])),,desc)
			
			change of color in bar plot
			create measure
			colourcode=if(selectedvalue(country_list[value])>=[rankvalue],"green","blue")
			format--->data colors--->expression--->filed value-->basedon 

71). change dynamically 
	goto tranform
	create columnindex
	create duplicate table 
	keep columns
	select unpivot
	close& apply
	select matrix
	select slicer
	field add column
	format --->selection_contol(on)
	
72). month wise ascending
	add column = if('custom	sort'[month]="jan","01/01/2023",
	

1. ribbon chart--------------similar to stacked cloumn quickly discover which data category has 
the highest sales

Question 1. Explain What Is Dax?

Answer :

DAX stands for Data Analysis Expressions, and it is the formula language simply it is a collection 
of functions, operators, and constants that can be used in a formula, or expression in Microsoft SQL 
Server Analysis Services, Power Pivot in Excel, and Power BI Desktop. Stated more simply, DAX helps 
you create new information from data already in your model.expressions.

Question 2. Explain When Do You Use Sumx() Instead Of Sum()?

Answer :

When the expressions to SUM() consits of anything else than a column name.

Typically when you want to add or multiply the values in different columns:

SUMX(Orderline, Orderline[quantity], Orderline[price])

SUMX() first creates a row context over the Sales table (see 1 above). It then iterates through 
this table one row at a time. SUM() is optimized for reducing over column segments and is as such 
not an iterator.

Python Interview Questions
Question 3. What Do You Understand By New Calendarauto() Function In Dax(ssas)?

Answer :

CALENDARAUTO function returns a table with a single column named “Date” that contains a contiguous 
set of dates. The range of dates is calculated automatically based on data in the model.

Example: In this example, the MinDate and MaxDate in the data model are July 1, 2010 and June 30, 2011.

CALENDARAUTO() will return all dates between January 1, 2010 and December 31, 2011.

CALENDARAUTO(3) will actually return all dates between April 1, 2010 and March 31, 2012.

Question 4. Name Any 3 Most Useful Aggregation Functions Dax?

Answer :

DAX has a number of aggregation functions, including the following commonly used functions:

SUM
AVERAGE
MIN
MAX
SUMX (and other X functions)
These functions work only on numeric columns, and generally can aggregate only one column at a time. 
However, special aggregation functions that end in X, such as SUMX, can work on multiple columns. 
These functions iterate through the table, and evaluate the expression for each row.

Python Tutorial
Question 5. Which Are The Three Places Where An Expression Can Be Evaluated And Hence A Specific 
Context Is Set?

Answer :

In a pivot table cell. Filter context is set by rows, columns, filters and slicers.
In a row cell (calculated column) Row context is set by the row itself.
In the measure calculation area of a table. No row, nor filter context is set.
ETL Testing Interview Questions
Question 6. Name Any 3 Most Useful Text Functions In Dax?

Answer :

The text functions in DAX include the following:

CONCATENTATE
REPLACE
SEARCH
UPPER
FIXED
These text work very similarly to the Excel functions that have the same name, so if you're 
familiar with how Excel handles text functions, you're already a step ahead. If not, you can 
always experiment with these functions in Power BI, and learn more about how they behave.

Question 7. How Is Filter Context Propagated Through Relationships?

Answer :

Filter context automatically propagates following the filtering of the relationship. It always 
propagates from the one side of the relationship to the many side. In addition, you also have the 
<u>option of enabling the propagation from the many side to the one side</u>. No functions are 
available to force the propagation: Everything happens inside the engine in an automatic way, 
according to the definition of relationships in the data model.

ETL Testing Tutorial Data science Interview Questions
Question 8. What Is The Difference Between Distinct() And Values() In Dax?

Answer :

Both count the distinct values, but VALUES() also counts a possible implictit virtual empty row 
because of non matching values in a child table. This is usually in a dimension table.

Question 9. Which Function Should You Use Rather Than Countrouws(distinct())?

Answer :

DISTINCTCOUNT()

Data analyst Interview Questions
Question 10. What Is A Pattern?

Answer :

A pattern is a general reusable solution to a commonly occurring problem.In Microsoft Excel, 
you use patterns every day to build tables, charts, reports, dashboards, and more.

R Programming language Tutorial
Question 11. What Are Dax Patterns?

Answer :

DAX Patterns is a collection of ready-to-use data models and formulas in DAX, which is the 
programming language of Power Pivot. Create your Excel data model faster by using a DAX pattern

Business intelligence Interview Questions
Question 12. Explain Related() And Relatedtable()?

Answer :

RELATED works when you have a row context on the table on the many side of a relationship. 
RELATEDTABLE works if the row context is active on the one side of a relationship. It is worth 
noting that both, RELATED and RELATEDTABLE, can traverse a long chain of relationships to gather 
their result; they are not limited to a single hop.

Python Interview Questions
Question 13. Explain How A Pivot Table Can Be Viewd As An Mvc System?

Answer :

Model = the Data Model (incl DAX expressions)
View = the table (or chart)
Controller = rows + columns + filters + slicers
What can you say about automatic filter propagation The filters only ever automatically flow from 
the "one" side of the relationship to the "many" side of the relationship; from the "arrow" side to 
the "dot" side; from the lookup table to the data table—whatever terms you use, it is always downhill.

With the lookup tables above and the data tables below, it is a mental cue to help you instantly 
visualize how automatic filter propagation works.

Question 14. How Does Calculate() Result In Context Transition?

Answer :

When in row context it transitions to filter context: the filter on the rows of a specific table 
propagates through the relationship to the related before the calculation is completed.

E.g. CALCULATE(SUM(OtherTable[column]) in a calculated column.

It extends or modifies an existing filter context, by adding a filter as its second parameter.

CALCULATE() always introduces filter context.

Question 15. What Is The Difference Between Max And Maxa Functions In Dax?

Answer :

The MAX function takes as an argument a column that contains numeric values. If the  column contains 
no numbers, MAX returns a blank. If you want to evaluate values that are not numbers, use the MAXA 
function.

R Programming language Interview Questions
Question 16. How Are Row Contexts Created?

Answer :

Automatically in a calculated column
Programmatically by using iterators.
Question 17. How Are Filter Contexts Created?

Answer :

Automatically by using fields on rows, columns, slicers, and filters.
Programmatically by using CALCULATE()
Ph analyzer Interview Questions
Question 18. How Can You Propagate Row Context Through Relationships?

Answer :

Propagation happens manually by using RELATED() and RELATEDTABLE(). These functions need to be used 
on the correct side of a one-to-many relationship: RELATED() on the many side, RELATEDTABLE() on the 
one side.

ETL Testing Interview Questions
Question 19. How Does Summarizecolumns Relate To Filtering?

Answer :

SUMMARIZECOLUMNS is not susceptible for outer (external) filters, in contrast to SUMMARIZE
you can add a filter (e.g. using FILTER) as a param of SUMMARIZCOLUMNS and it will filter accordingly. 
It acts as if you have added a filter in a pivot table.
Question 20. What Is The Initial Filter Context?

Answer :

The initial filter context comes from four areas of a pivot table:

Rows
Columns
Filters
Slicers
It is the standard filtering coming from a pivot table before any possible modifications from DAX 
formulas using CALCULATE().

Question 21. Why Donot You Use A Calculate() In The Aggregation Expression Of A Summarizecolumn()?

Answer :

The CALCULATE() is automatically generated.

Question 22. What Is The Difference Between Having A Measure As A Second Filter Param And Having The 
Original Measure Expression As A Param. Filter(table, [measure]) Vs Filter(table, Sum(...))?

Answer :

A measure has always implicit filter context, so the ROW context induced by the FILTER is transferred 
to filter context in the measure.<br>In case of the expression only, no filter context is imposed on 
the expression, so the expression is evaluated with an empty filter context! This gives a different 
result.

Question 23. Dax Nested Functions Is Equivalent To Sql What?

Answer :

SQL subqueries.

Q1. How would you handle data from multiple sources with different granularity levels?
A1. Handling data from multiple sources with different granularity levels involves the following 
steps:

Data Integration:
Use Power Query to connect and extract data from multiple sources.
Apply data transformations, clean, and prepare the data for analysis.
Data Modeling:
Create relationships between tables to link data from different sources.
Use common dimensions to establish relationships between tables with different granularity levels.
Granularity Adjustment:
Create new calculated columns or measures to adjust granularity levels.
Use DAX (Data Analysis Expressions) to aggregate or disaggregate data as required.
Data Validation:
Compare aggregated data with source data to ensure accuracy.
Address any discrepancies to maintain data integrity.
Q2. Explain the process of creating a dynamic KPI visualization in Power BI.
A2. The process of creating a dynamic KPI visualization in Power BI involves the following steps:

Prepare the Data:
Import or connect to the data source.
Clean, transform, and model the data as required.
Create Measures:
Use DAX to create measures for KPI calculations, such as the actual value, target value, 
and percentage difference.
Create KPI Visuals:
Select the appropriate visuals for KPI display, such as cards, gauges, or custom visuals 
like KPI indicators.
Add the created measures to the respective fields in the visual.
Make KPIs Dynamic:
Add slicers or filters to allow users to interactively change the displayed data based on 
specific criteria, such as date range, product category, or region.
Q3. How would you visualize hierarchical data using Power BI visuals?
A3. Hierarchical data can be visualized using several Power BI visuals, such as:

Treemap: Displays hierarchical data in nested rectangles, with parent categories represented by 
larger rectangles and child categories within them.
Sunburst: Represents hierarchical data in a circular format, with parent categories in the center 
and child categories in outer rings.
Hierarchy Slicer: Allows users to interactively navigate through hierarchical data and filter the 
report based on the selected level.
Matrix: Displays data in a tabular format with hierarchical row and column headers.
Q4. Describe the steps to create a rolling average or moving average in Power BI.
A4. Creating a rolling average or moving average in Power BI involves the following steps:

Prepare the Data:
Import or connect to the data source.
Ensure that the data is sorted by date or a relevant time period.
Create a Date Table (if not already present):
Use DAX to create a date table with a continuous date range.
Establish a relationship between the date table and the data source.
Create a Rolling Average Measure:
Use DAX to create a measure that calculates the rolling or moving average.
Incorporate window functions like AVERAGEX, DATESINPERIOD, or DATEADD to define the rolling period.
Add the Measure to a Visual:
Select an appropriate visual, such as a line chart or a bar chart.
Add the rolling average measure along with other relevant fields to the visual.

Power BI DAX Scenario-Based Interview Questions
DAX (Data Analysis Expressions) is a formula language used in Power BI to create custom calculations 
and aggregations. These questions evaluate a candidates knowledge and practical skills in using DAX 
functions and expressions to solve complex analytical problems. Questions may involve creating 
calculated measures, time intelligence functions, or filters to deliver meaningful insights from the 
data. A strong candidate will be able to demonstrate their ability to create efficient and accurate 
DAX formulas tailored to specific business scenarios.

Q5. How do you create a measure that calculates year-to-date sales using DAX?
A5. To create a measure that calculates year-to-date (YTD) sales using DAX, follow these steps:

Identify the relevant columns:
Locate the columns containing the date and sales data in your data model.
Create the YTD measure:
Use the CALCULATE and TOTALYTD functions to calculate the YTD sales.
For example, if you have a column named 'SalesAmount' and a date column named 'OrderDate', 
the DAX expression would be:
YTD Sales = CALCULATE(SUM('Sales'[SalesAmount]), TOTALYTD(SUM('Sales'[SalesAmount]), 
'Sales'[OrderDate]))

Q6. Explain how to calculate a dynamic ranking in Power BI using DAX.
A6. To calculate a dynamic ranking in Power BI using DAX, follow these steps:

Identify the relevant columns:
Locate the columns containing the data for which the ranking will be calculated.
Create a ranking measure:
Use the RANKX function to create a measure that calculates the ranking based on the desired criteria.
For example, if you want to rank products by sales, the DAX expression would be:
Product Rank = RANKX(ALL('Products'), CALCULATE(SUM('Sales'[SalesAmount])))

Q7. Describe the process of creating a cumulative total using DAX in Power BI.
A7. To create a cumulative total using DAX in Power BI, follow these steps:

Identify the relevant columns:
Locate the columns containing the data for which the cumulative total will be calculated.
Create a cumulative total measure:
Use the CALCULATE and FILTER functions to create a measure that calculates the cumulative total 
based on the desired criteria.
For example, if you want to calculate the cumulative sales by date, the DAX expression would be:
Cumulative Sales = CALCULATE(SUM('Sales'[SalesAmount]), FILTER(ALLSELECTED('Sales'[OrderDate]), 
'Sales'[OrderDate] <= MAX('Sales'[OrderDate])))

Q8. How can you use DAX to handle data discrepancies and irregularities?
A8. DAX can be used to handle data discrepancies and irregularities in various ways, such as:

Data Cleaning:
Use DAX functions like TRIM, SUBSTITUTE, or REPLACE to remove unwanted characters, spaces, or 
correct typos.
Data Transformation:
Use DAX functions like UPPER, LOWER, or PROPER to standardize text case.
Use DAX functions like DATE, EOMONTH, or DATEADD to manipulate date values.
Handling Missing or Incomplete Data:
Use DAX functions like IF, SWITCH, or COALESCE to replace missing or incomplete data with default 
values or alternative data.
Error Handling:
Use DAX functions like ISERROR, IFERROR, or DIVIDE to handle errors in calculations or data retrieval.
Data Validation:
Use DAX functions like CONTAINS, LOOKUPVALUE, or RELATED to validate data against other tables or 
data sources.
Power BI Performance and Optimization Scenario Questions
These questions focus on a candidates understanding of Power BI performance and optimization 
techniques. Topics include optimizing data model size, improving DAX calculations, using query folding,
 and managing visual and data refresh performance. Candidates should demonstrate their ability to 
 identify performance bottlenecks, propose solutions, and apply best practices to ensure the efficient 
 and smooth functioning of Power BI reports and dashboards.

Q9. What are the key factors that impact Power BI report performance?
A9. The key factors impacting Power BI report performance include:

Data Size: Larger datasets require more memory and processing power, which can affect report performance.
Data Model Complexity: Complex relationships, multiple tables, and calculated columns or measures can 
impact performance.
Data Source Type: Connecting to slow or unstable data sources can cause delays in report loading and 
refreshing.
DAX Calculations: Complex or inefficient DAX expressions can increase report rendering time.
Visuals and Filters: Using a large number of visuals or filters can slow down report rendering.
Custom Visuals: Custom visuals may have a higher performance overhead compared to built-in visuals.
Data Refresh Frequency: Frequent data refreshes can impact performance, especially during peak usage 
times.
Q10. How do you optimize data model relationships for better performance?
A10. To optimize data model relationships for better performance, follow these best practices:

Minimize the Number of Relationships: Reduce the number of relationships by removing unnecessary ones 
and consolidating tables when possible.
Use Single-Direction Relationships: Avoid bi-directional relationships, as they can cause ambiguity and 
performance issues.
Use Star Schema: Organize data into a star schema with a central fact table and related dimension 
tables to simplify relationships and improve performance.
Optimize Data Types: Use appropriate data types for columns, and avoid using high cardinality columns 
as keys.
Minimize Calculated Columns: Replace calculated columns with measures where possible to reduce storage 
and processing overhead.
Q11. Describe the process of optimizing DAX calculations to improve report rendering time.
A11. To optimize DAX calculations, follow these best practices:

Use Simple Expressions: Break down complex expressions into simpler components and use variables where 
appropriate.
Use Measures: Use measures instead of calculated columns to improve performance and reduce storage 
requirements.
Optimize Aggregations: Use DAX functions like SUMX, AVERAGEX, or COUNTX instead of iterating over 
entire tables.
Leverage Time Intelligence Functions: Use built-in time intelligence functions like TOTALYTD or 
SAMEPERIODLASTYEAR for time-based calculations.
Avoid Expensive Functions: Minimize the use of expensive functions like RANKX, PATH, or EARLIER.
Q12. How do you use Power BI's performance analyzer to identify bottlenecks?
A12. To use Power BI's Performance Analyzer, follow these steps:

Open Performance Analyzer: In Power BI Desktop, go to the View tab and click on Performance Analyzer.
Start Recording: Click the 'Start Recording' button in the Performance Analyzer pane to begin capturing 
performance data.
Interact with Report: Refresh or interact with the report to capture performance data for each visual 
and action.
Analyze Results: Review the recorded data in the Performance Analyzer pane, focusing on high DAX query 
duration, visual display, and other resource-intensive operations.
Identify Bottlenecks: Look for long execution times, inefficient DAX expressions, or complex visuals 
that may be affecting performance.
Optimize: Apply optimization techniques to address identified bottlenecks, such as simplifying DAX 
expressions, reducing the number of visuals, or using more efficient filters.
Repeat: Continuously monitor and analyze performance to ensure optimal report performance.
Check Data Visualization Interview Questions Now!

Power BI Security and Data Governance Scenario Questions
Security and data governance are critical aspects of Power BI implementation. These questions aim to 
assess a candidate's knowledge of Power BI security features, such as Row-Level Security (RLS), data 
classification, and data encryption. Additionally, they may cover topics related to data governance 
policies, such as data lineage, data cataloging, and compliance. A strong candidate will be able to 
showcase their understanding of Power BI security features and how to implement them in various 
scenarios while adhering to data governance best practices.

Q13. How would you implement row-level security in Power BI?
A13. To implement row-level security (RLS) in Power BI, follow these steps:

Identify Data Model: Determine the tables and columns in your data model that require row-level 
security.
Create Roles: In Power BI Desktop, go to the Modeling tab and click 'Manage Roles'. Create a role 
for each group of users who require unique access.
Define Filters: For each role, define DAX filters that control access to rows based on user attributes 
or data relationships.
Example: [Region] = USERPRINCIPALNAME() to filter data by the user's region.
Publish Report: Save the report and publish it to the Power BI Service.
Assign Roles: In Power BI Service, go to the dataset's settings and assign the roles to appropriate 
users or groups.
Test Access: Verify that users can only access the data permitted by their role.
Q14. Explain the process of setting up data classification and sensitivity labels in Power BI.
A14. To set up data classification and sensitivity labels in Power BI, follow these steps:

Enable Sensitivity Labels: In Power BI Service, go to the Admin Portal, select 'Tenant settings', 
and enable the sensitivity labels feature.
Configure Labels: In the Microsoft 365 Compliance Center, create and configure sensitivity labels 
with the desired classification settings.
Apply Labels: In Power BI Desktop or Service, open the report, go to the 'Home' tab, and select 
'Sensitivity label' to apply the appropriate label.
Monitor Compliance: Use the Microsoft 365 Compliance Center to monitor the usage of sensitivity 
labels and ensure compliance with data protection policies.
Q15. How do you share reports and dashboards securely with external users?
A15. To share reports and dashboards securely with external users, follow these steps:

Enable External Sharing: In Power BI Service, go to the Admin Portal, select 'Tenant settings', 
and enable external sharing for the desired content types.
Configure Azure AD B2B: Set up Azure Active Directory B2B to manage external user access and 
permissions.
Share Content: In Power BI Service, open the report or dashboard, click the 'Share' button, 
and enter the external user's email address.
Assign Permissions: Assign appropriate permissions to the external user, such as 'Viewer' 
or 'Contributor'.
Monitor Access: Regularly review access and sharing settings to ensure data security and compliance.
Q16. Describe the process of auditing and monitoring user activity in Power BI.
A16. To audit and monitor user activity in Power BI, follow these steps:

Enable Auditing: In Power BI Service, go to the Admin Portal, select 'Tenant settings', and 
enable the auditing feature.
Configure Audit Settings: In the Microsoft 365 Compliance Center, set up audit log search, 
retention policies, and alerts based on specific user activities.
Review Audit Logs: Use the Microsoft 365 Compliance Center or Power BI Activity Log API to review 
audit logs and analyze user activities.
Monitor Usage Metrics: In Power BI Service, review usage metrics for reports and dashboards to 
identify trends, popular content, and potential security risks.
Set Up Alerts: Create alerts based on specific user activities or usage patterns to proactively 
identify potential security risks and ensure compliance.
Power BI Integration and Advanced Scenarios
These questions evaluate a candidate's experience with integrating Power BI into various data sources, 
platforms, and advanced analytical scenarios. Topics may include connecting to different data sources, 
working with real-time data, embedding Power BI reports into external applications, and integrating with other tools such as Azure Machine Learning or R/Python scripts for advanced analytics. Candidates should demonstrate their ability to leverage Power BI's capabilities and integrate it seamlessly with other technologies to deliver comprehensive and advanced analytical solutions.

Q17: How can you integrate Power BI with other Microsoft tools like Azure and Power Automate?
A17: Power BI can be integrated with other Microsoft tools like Azure and Power Automate in the 
following ways:

Azure Integration:
Azure SQL Database: Power BI can connect to Azure SQL Database to access and analyze data stored in it.
Azure Analysis Services: Power BI can connect to Azure Analysis Services to consume data models and 
create reports and dashboards.
Azure Data Factory: Power BI can utilize Azure Data Factory pipelines to move and transform data 
from various sources to a Power BI dataset.
Azure Data Lake Storage: Power BI can connect to Azure Data Lake Storage to access large volumes 
of data for analysis.
Power Automate Integration:
Data-driven alerts: Power BI can trigger Power Automate flows when a specific data condition is met,
enabling automated actions.
Export and share data: Power BI can utilize Power Automate to export and share data with other 
users or applications.
Scheduled data refresh: Power BI can trigger Power Automate flows to perform scheduled data refreshes 
from various data sources.
Q18: Describe the process of embedding Power BI reports into a custom application.
A18: Embedding Power BI reports into a custom application involves the following steps:

Register an application in the Azure portal to obtain an Application ID and set up the required API 
permissions.
Implement user authentication and authorization using Azure Active Directory.
Generate an access token to access Power BI resources.
Use Power BI REST APIs or Power BI Embedded SDK to load, embed, and interact with the Power BI report 
within the custom application.
Q19: How can you use Power BI to analyze real-time data?
A19: Power BI can analyze real-time data by:

Using DirectQuery: Connect to a data source that supports DirectQuery, enabling real-time data analysis
without the need to load data into Power BI.
Streaming datasets: Create streaming datasets in Power BI to push real-time data through APIs or Azure 
Stream Analytics.
Real-time dashboards: Build real-time dashboards using the streaming datasets to visualize and monitor 
data changes instantly.
Q20: What are the steps to set up incremental data refresh in Power BI?
A20: To set up incremental data refresh in Power BI, follow these steps:

Import data: Import data into Power BI and create a data model.
Configure parameters: Set up parameters for the data range to be refreshed incrementally (e.g., 
StartDate and EndDate).
Apply filters: Apply a custom filter based on the parameters to the data query.
Configure incremental refresh policy: In the Power BI Desktop, configure the incremental refresh 
policy by setting the refresh range, number of historical periods, and refresh frequency.
Publish: Publish the dataset to Power BI Service.
Schedule refresh: Configure the scheduled refresh for the dataset in Power BI Service.
Tips for Acing Power BI Scenario-Based Interviews
Acing a Power BI scenario-based interview requires preparation, practice, and understanding of 
the concepts related to Power BI and data analysis. Here are some tips to help you prepare for and 
excel in such interviews:

Understand Power BI fundamentals: Familiarize yourself with the core concepts and components of 
Power BI, such as data sources, data modeling, DAX, visualizations, and reports. Understanding the 
basics will enable you to tackle scenario-based questions with confidence.
Practice common scenarios: Be prepared to address common Power BI scenarios, such as importing data, 
creating relationships, building calculated columns or measures, and designing visualizations. Practice 
these scenarios in the Power BI environment to become more comfortable and efficient.
Learn DAX functions and formulas: DAX (Data Analysis Expressions) is the formula language used in 
Power BI. Understand the commonly used DAX functions and practice writing DAX expressions for different 
scenarios.
Study data visualization best practices: Learn the principles of effective data visualization and 
how to choose the right visual for a given scenario. Familiarize yourself with Power BI's native 
visuals and their customization options.
Get hands-on experience: Work on real-world projects or participate in online challenges to gain 
practical experience in using Power BI. This will not only help you understand the platform better but 
also give you examples to showcase during the interview.
Prepare a portfolio: Create a portfolio of your Power BI projects, which demonstrates your skills 
in data analysis, visualization, and report creation. Share this portfolio with the interviewer to 
showcase your expertise.
Review Power BI updates and features: Stay updated with the latest Power BI developments, features, 
and improvements. This will help you handle questions about new or advanced features during the 
interview.
Practice problem-solving: Develop your problem-solving skills by practicing scenario-based questions 
from online forums, blogs, or interview preparation resources. This will help you think on your feet 
and address complex scenarios during the interview.
Understand the business context: Before the interview, research the company and industry to understand 
their business context and challenges. This will help you tailor your responses to the specific needs 
of the company.
Be prepared for follow-up questions: Interviewers may ask follow-up questions to test your 
understanding or explore the depth of your knowledge. Be prepared to explain your thought process, 
discuss alternative approaches, and justify your choices.

Q.1. What is SSRS? How is it different from Power BI?

Ans. SSRS stands for SQL Service Reporting Service. It is a server-based reporting generating platform. SSRS is a part of Microsoft’s SQL Server suite. It is similar to Power BI in a lot of ways, but it is more of a conventional tool. SSRS is mainly used for enterprise visualization of data and generating, viewing and sharing reports. It has a programming interface with an integrated set of processing components. SSRS has less graphical, drag and drop features and more programming-based tools for the report making. Due to this, users need to put in more manual efforts.

Here are some basic differences between Power BI and SSRS:

Power BI is free, SSRS requires SQL Server license. However, you require purchasing Power BI Premium license for Power BI Report Server.
Power BI cloud-based while SSRS is server-based.
Power BI is more modern and graphical whereas, SSRS is conventional and programming based. SSRS requires manual effort and time to create reports and do analysis.
We can use data from the cloud in Power BI. With SSRS, we can only use on-premise data.
Power BI now has Cortana integrated for AI-based natural language, Q&A about your data and reports in Power BI. SSRS does not have this feature.
In SSRS, you need to purchase a license, define requirements and scope, customize your software, deploy, develop reports in a coding interface, schedule data refreshes, etc.
Power BI has a graphical interface with the drag-and-drop capability to create reports. You can work with unstructured data, use modern rendering, publish, integrate and collaborate easily across platforms.
Q.2. What are paginated reports?
AD

Ans. A paginated report is an organized, document style page to page report. Paginated reports are saved as paged documents where we can expand the document vertically and horizontally to view the complete data. These reports are pixel-perfect with a fixed layout. They can be the best options when we want to print a report from a PDF or Word file. The extension used for paginated files are .RDL.

Q.3. What are ‘Measures’ in Power BI? How can we create them?

Ans. Measures are formulas that are calculated to yield results of complex queries (specific to the purpose and values it is used for). Generally, measures are used in aggregational calculations such as sum, average, minimum value, maximum value, counts, etc. The resultant values are in RAM storage because measures are used relatively and may have different values when used in different scenarios and contexts.

Measures in Power BI are used to create advanced solutions and models for data analysis and reporting. They perform real-time calculations based on your interactions with data on your report.
AD

We can create new measure fields for analyzing in Power BI Desktop easily. We can also create a new measure field using New measure option and select this option in two ways:

One, by right-clicking on the table’s name in which we wish to add the measure field and select New measure.
Second, by going to the Modeling tab and clicking on New measure option.
Then in the formula bar, we need to enter the name of our measure and write the expression for the measure.

Q.4. What do you understand by the Power BI Gateway?

Ans. Power BI Gateway is a software that is used to access data situated in an on-premises network from the cloud. Gateways act as a gatekeeper for the on-premises data source. If anyone needs to access on-premises data from a cloud or web-based app, the request goes through the gateway. All the connection requests are attended by the gateway and access is granted based on the user’s authentication and requirements.

Gateways do not transfer data from the on-premises source to the client platform. It only connects that platform directly to the on-premises data source for the clients to directly access data from it. Gateways are used to facilitate connections between a single data source or multiple data source to the on-premises data source.

Q.5. What is Bidirectional cross-filtering in Power BI?
AD

Ans. The bidirectional cross-filtering feature enables a free flow of filtering conditions between data tables. In Power BI, some data models are simple, with a star schema type association. Whereas some data models are complex having tables with many to many relationships. Thus, by using the bidirectional cross-filtering feature, a modeler can let the filtering conditions be applied on both sides of a relationship or association. The filters have a certain direction and can be applied to values in different tables according to the relationship that the tables share with each other. Bidirectional cross-filtering gives a lot of flexibility to the data modelers to create models and apply filtering conditions on data tables with many to many relationships.

Q.6. What is Power BI Designer?

Ans. Power BI Designer is a stand-alone companion application of Power BI. It consists of Power Query, Power Pivot and Power View, all together in one application. Power BI Designer is used to create Power BI reports and other elements and to work with data. We can download Power BI Designer from the Power BI Site. The reports created in Power BI Designer can be later published on the Power BI Service.

Q.7. What is DAX in Power BI?

Ans. DAX stands for Data Analysis Expressions. It is a formula language with such expressions or formulas that are used for data analysis and calculations. These expressions are a combination of functions, operators, and constants. The expression is evaluated as one formula that yields appropriate results (value or values). With the help of the DAX language, analysts can discover new ways to calculate data values they have and come up with fresh insights. Power BI Desktop offers a library having about 200 DAX functions to perform complex calculations.

DAX formula syntax and sample formula:

DAX Syntax - Power BI interview questions

A. Name of the new measure
B. An operator indicating the start of the DAX formula and equating the two sides
C. DAX function
D. The parenthesis (). Used to enclose and define arguments.
E. Reference table name
F. Reference column name
G. Another operator

A sample DAX formula is:

ProjectedSales2019=SUM(Sales[TotalSales2018])*1.08

This DAX formula commands the system to calculate the product of the sum of TotalSales2018 and 1.08 (8% increase) and store the value in a new field or column known as ProjectedSales2019.

Q.8. What is Power Query? Which language is used in the Power Query?

Ans. Power Query is an Excel add-on. It is a self-service ETL tool (Extract, Transform and Load) which is used to import data, transform, shape/clean data and load it for analysis. Power Query provides an interactive user interface to manage and work with data. We can import data from multiple data sources such as Big Data, files, databases, social media, etc. We can join data from different sources and make one single dataset. Also, we can transform the data by adding, removing and shaping our datasets as per our requirement.
AD

The programming language used in Power Query Editor is known as M-code. It is easy to learn case sensitive language.

Q.9. What are some key points about DAX usage in Power BI?

Ans. Some key points about DAX:

DAX is a functional language. That means, its complete code is always a function.
An executable DAX expression generally contains conditional statements, nested functions, value references, etc.
DAX formulas have two primary data types; Numeric and Non-numeric or Others. The numeric data type includes integers, decimals, currency, etc. And, the non-numeric consists of strings and binary objects.
DAX expressions are evaluated in an inward to outward fashion. That is, it starts from the innermost function going to the outermost one at the very last. We should formulate our DAX expressions in proper order so that the system reads it properly.
We can use values of mixed data types as inputs in a DAX formula. Data type conversion will take place automatically during execution of the formula.
Q.10. Which table functions will you use to group data in Power BI?

Ans. There are two main DAX functions which we can use to group data in Power BI; SUMMARIZE() and SUMMARIZECOLUMNS:

The SUMMARIZE function is used to group data by columns.
The SUMMARIZECOLUMNS function is generally used in Power BI to group data by columns, expressions, and tables.
Q.11. What are query parameters? What are Power BI Templates?

Ans. Query parameters are the parameters which we can use as/in queries in Power BI query editor. We can create new parameters in Power BI Desktop and later use them in queries, data models and reports. Query parameters contain a selected set of data values from the entire dataset.

Power BI Templates are data-less PBIX files, that is, empty Power BI templates in which we can use our data. Such PBIX files are exported as template files (PBIT) via share options or emails so that others can import their data into them without having to create a template.
AD

Q.12. Explain the Power Pivot. How is it useful for Power BI?

Ans. Power Pivot is an Excel add-in which is used to collect data from multiple data sources, create datasets and use that data for analysis and drawing insights for business and decision making. We can perform a lot of activities in Power Pivot:

Import millions of rows of data into a single Excel workbook.
Create relationships between heterogeneous data tables and rows.
Create calculated columns and measures by using queries and formula.
Build PivotCharts and PivotTables.
The charts and tables created in Power Pivot can be used in Power BI for further analysis and report making.

Q.13. What is a Power Pivot data model? Which analytics engine used in Power Pivot?

Ans. The data models are the relationships formed between different data tables to structure the information properly. A data model will have defined data types, columns, associations, tables, relations, etc. The data models in the Power Pivot only support single direction relationships that are one-to-many and calculated columns rather than calculated tables in Power BI.

Power Pivot currently uses the SSAS in-memory Vertipaq compression engine. The data models are stored in the in-memory of the client computer.

Q.14. How many active relationships can we have between two tables in Power Pivot data model?

Ans. We can have more than one relationship between tables in a Power Pivot data model. But there can be only one active relationship at a time in the data model between two tables. While one of the many relationships are active, the other relationships remain in an inactive state. In the Power Pivot data model, active relationships are indicated by a continuous line and inactive relationships by dotted lines.

Q.15. Tell us about “Query folding” in Power Query.

Ans. Query folding is the process of converting or translating the code in Power Query Editor into SQL. Query folding is needed when codes or queries are getting executed by the source database instead of the client machine. This happens when there are limited resources on the client machine. It also helps in performance optimization and scaling.

Q.16. What do you know about the transformation in Power Query Editor?

Ans. The Power Query Editor enables us to import data from multiple sources and transform it in many ways as per our requirements. Some general data transformation practices in Power Query Editor are:

Change data types of columns.
Rename columns.
Replace values.
Fix errors in Any Column group.
Working with the nested data in Structured Column groups.
Add custom columns, conditional columns, add measures, etc.
Run R Queries directly on Power BI Query Editor by using Run R Script function.
Q.17. Why should we use SQL code in Power Query editor?

Ans. It is good to use SQL codes in Power Query editor along with M-code when we need to explain complex logic or want to add some additional processes in the query. SQL statements simplify the M function and pass on a bug-free, an easy-to-read query to the source database from the client machine.

Q.18. Can you tell us why do we need Power Query when we already have Power Pivot to import data?

Ans. Power Query is a self-service Excel add-in, which is used to import data from different sources, transform or manipulate it and then load it into Excel. It is a typical ETL tool which is loaded with functionalities and tools to extract, transform and load data from different kinds of data sources to create single datasets. Whereas Power Pivot is also an Excel add-in, but it does not focus on data transformation and preparation.

Rather, Power Pivot is more about loading data, creating data models and visualizing the data to gain important business insights. In Power Query, you can connect to many different data sources and manipulate the data instantly before loading it to any other platform.

Q.19. What do you know about the Power Map?

Ans. Power Map is also an Excel add-in whose outputs we can use in Power BI. Power Map has the tools to visualize geo-coded data in maps. We can create 3-D visuals with heat maps, bubbles, columns on Bing maps. We can also use time-stamped data points on the map.

Q.20. What are the different types of data refreshes in Power BI?

In Power BI, data of published reports can be refreshed in four ways; Package refresh, Model refresh, Tile refresh, and Visual container refresh.

Package refresh – The package refresh will refresh the report by updating the data from SharePoint Online or OneDrive. Package refreshing does not refresh data from the source but from its cloud location.
Model or Data refresh – This type of refreshing refreshes data in a report from its original data source. Model or data refresh is done within the Power BI Service with the help of gateway permission for on-premises data sources. This method uses Refresh now, or Schedule refresh options.
Tile refresh – Tile refresh refreshes the cache data of all the tiles on a dashboard. It occurs in every 15 minutes automatically. If it does not happen, we can select the Refresh dashboard tiles option from the ellipses(…) icon on the dashboard.
Visual container refresh – This refresh refreshes the cache of all the visuals containers of a Power BI report.
Q.21. What are the calculated columns in Power BI?

Ans. A calculated column is a query or DAX formula generated column in a data table. 
Each value in a calculated column is calculated while the code is computed by the system. 
The values are a result of the evaluated and calculated DAX formula. The values of a calculated 
column are not compressed and hence take up more space in memory than other data values.

Q.22. How can we use a gateway for Power BI?

Ans. You will be ready to use the data gateway in Power BI by following the four steps given below:
Install a gateway in your system.
Add users to the gateway who need to access data from on-premises data sources.
Connect to on-premises data sources. This step is important because this is how users 
can use data from on-premises data sources for data analysis and report generation.
Refresh on-premises data to keep the data in reports and dashboards up to date.

Q.23. What is an Advanced editor in Power BI?

Ans. An Advanced Editor is an editor within the Power Query Editor. 
It is used to view the M-code for any query. The Advanced Editor is generally used to 
check the syntax of a query that will be run in the editor.

We can access the Advanced Editor from the Home or View tab in Power Query Editor. 
We can select a query from the list of queries and work with it in the Advanced editor 
window and analyze the code step by step.

Q.24. In what ways can you shape or organize data in Power BI?

Ans. There are three common data shaping techniques in Power BI:
Removing the columns and rows from a data table.
Adding indexes for the data tables.
Applying a Sort Order on the values of a data table.

Q.25. How can we refresh Power BI reports after publishing them to the cloud?

Ans. We can refresh the Power BI reports after they are published on the cloud using gateways. 
If we want to refresh the data of a report published on SharePoint, then Data Management 
Gateway is used. And if the report is published on the Power BI website then 
Power BI Personal Gateway is used for data refreshing.

Q.26. Can we map geographic data into Power BI Reports? If yes, then how?

Ans. Yes, we can map the geographic data into Power BI reports in several ways. 
Power BI has integration with Bing Maps which provides the coordinates of locations
on the map by default. This process is known as geocoding and the users don’t need 
to manually provide longitude and latitude coordinates. You can use the map charts 
and filled map charts in Power BI to use the geographic data in Power BI reports and dashboards.

Q.27. What is z-order in Power BI?

Ans. The z-order in Power BI is referred to the strategy or order of arrangement 
of different elements on a Power BI report. The z-order helps us in properly arranging 
all the elements in a report such as visualizations, tables, slicers, etc.

The Arrange option in Power BI helps us arrange or place report elements in z-order. 
Using that option, we can bring objects on front, send them to back, and layer the 
visualizations, according to our need. So, in a nutshell, z-order is the order of 
arranging or layering multiple objects and visual elements in a report on top of each other. 
Z-order is also applied when we are using shapes to enhance the design of a report.

Q.28. What are the important prerequisites for connecting Power BI to a database in Azure SQL Database?

Ans. In order to establish a secure connection of Power BI and Azure SQL Database,
there is one important prerequisite. Before we make an attempt to connect to an Azure 
SQL Database, we should configure the firewall settings to allow remote connections. 
If firewall settings are not set up, we cannot have a stable and secure connection to 
Azure SQL Database.

Q.29. What are the prerequisites of installing a gateway in your system?

Ans. The following requirements are necessary for installing a gateway in our systems:

	.NET 4.5 Framework
	Windows 7 (64-bit version)/ Windows Server 2008 R2 or later
	8 core CPU
	8 GB memory
	Windows 2012 R2 (64-bit)
Q.30. Can we use Power BI on mobile devices?

Ans. Yes, we can use Power BI on mobile devices.
	Power BI has mobile compatible apps for Android devices, iOS devices, 
	and Windows 10 devices. We can download the Power BI app for a preferred 
	device from app stores such as Google Play, Microsoft Store or Apple App Store.	
	
# 
In summary, LOOKUPVALUE is used to retrieve specific values from a table based on search criteria,
while TREATAS is used to create virtual relationships between tables to modify the filter context 
during calculations.

#
Rolling 12 Months Salary = 
    CALCULATE(
        SUM(Salary[Amount]),
        FILTER(
            ALL(Salary),
            Salary[Date] <= EARLIER(Salary[Date]) &&
            Salary[Date] > DATEADD(EARLIER(Salary[Date]), -12, MONTH)
        )
    )
#
DateTable = CALENDAR(DATE(YearMin,1,1), DATE(YearMax,12,31))

Rolling12MonthsSalary = 
CALCULATE(SUM(SalaryColumn),
    DATESINPERIOD(DateTable[Date], LASTDATE(DateTable[Date]), -12, MONTH)
)

#TOTALYTD: Calculates a cumulative total for a measure from the beginning of the year up to the given date.

Syntax: TOTALYTD(<expression>, <dates>[, <filter>])

Example: TOTALYTD(SUM(Sales[Amount]), Dates[Date])

TOTALMTD: Calculates a cumulative total for a measure from the beginning of the month up to the given date.

Syntax: TOTALMTD(<expression>, <dates>[, <filter>])

Example: TOTALMTD(SUM(Sales[Amount]), Dates[Date])

TOTALQTD: Calculates a cumulative total for a measure from the beginning of the quarter up to the given date.

Syntax: TOTALQTD(<expression>, <dates>[, <filter>])

Example: TOTALQTD(SUM(Sales[Amount]), Dates[Date])

PREVIOUSYEAR: Returns a table that contains a column of dates from the previous year based on the specified dates.

Syntax: PREVIOUSYEAR(<dates>)

Example: CALCULATE(SUM(Sales[Amount]), PREVIOUSYEAR(Dates[Date]))

SAMEPERIODLASTYEAR: Returns a table that contains a column of dates from the previous year that corresponds to the same period as the specified dates.

Syntax: SAMEPERIODLASTYEAR(<dates>)

Example: CALCULATE(SUM(Sales[Amount]), SAMEPERIODLASTYEAR(Dates[Date]))

DATESYTD: Returns a table of dates from the beginning of the year up to the given date.

Syntax: DATESYTD(<dates>)

Example: CALCULATE(SUM(Sales[Amount]), DATESYTD(Dates[Date]))

#STARTOFYEAR 

Measure = CALCULATE(SUM(Sales[Amount]), STARTOFYEAR(Sales[Date]))

#
ClosingBalanceSalesAmount = CLOSINGBALANCEMONTH([SalesAmount], 'Table'[Date])

#
Top N dynamic

Top N Products = 
VAR N = 10   -- Replace 10 with the desired value of N
RETURN
    TOPN(N, ALL('Products'), [Total Sales])

#

Weekday Sales = CALCULATE(SUM(SalesTable[SalesAmount]), WEEKDAY(SalesTable[Date]) <= 5)

#
table ="country"
column = "name"
Values=["ganesh","rajesh","jathin"}]

sum of all string elements =

sumx(Employee,LEN(Employee[Name]))


MonthName = switch(True(), Month= 1, "jan",Month = 2, "Feb",Month = 3, "March",Month = 4,
 "April",Month = 5, "May",Month = 6, "June",Month = 7, "july",Month = 8, "Aug",Month = 9,
 "Sept",Month = 10, "Oct",Month = 11, "Nov",Month = 12, "Dec")
 
Values dax function is alternative of DISTINCTCOUNT			countrows+values
= countrows(values[column])
= countrows(DISTINCT[column])
	
# Name of function													Description
CLOSINGBALANCEMONTH(expression , dates ,[filter])		Evaluates specified expression for the last 
															day of the given month.
CLOSINGBALANCEQUARTER(expression , dates ,[filter])		Evaluates specified expression for the last 
															day of the given quarter.
CLOSINGBALANCEYEAR(expression , dates , [filter])		Evaluates specified expression for the last 
															day of the given year.
DATEADD(date, number_of_intervals to shift, interval)	Used for shifting (offsetting) a set of dates. 
															Intervals can be specifed as day, month, 
															quarter or year.
DATESBETWEEN(column, start_date, end_date)				Returns a table of dates. Create as a new table, 
															or use as a filter in a CALCULATE expression.
DATESINPERIOD(date,start_date,number_of_intervals, intervals)	
														Returns a table of dates. Create as a new table,
														or use as a filter in a CALCULATE expression. 
														Intervals can be specifed as day, month, quarter 
														or year.
DATESMTD(date)											Use with CALCULATE to return month to date sales. 
															This will "reset" each month.
DATESQTD (date)											Use with CALCULATE to return quarter to date 
															sales. This will "reset" each quarter.
DATESYTD (date [Year_end_date])							Use with CALCULATE to return year to date sales.
															This will "reset" each year.
ENDOFMONTH(date)										Returns the last day of the month
ENDOFQUARTER(date)										Returns the last day of the quarter
ENDOFYEAR(date)											Returns the last day of the year
FIRSTDATE (datecolumn)									Use to return the first date in your table.
FIRSTNONBLANKDATE (datecolumn , [expression])			Returns the first value in the column, where 
															the expression is not blank.
LASTDATE (datecolumn)									Use to return the last date in your table.
LASTNONBLANKDATE (datecolumn ,[expression])				Returns the last value in the column, 
															where the expression is not blank.
NEXTDAY(date)											Use with CALCULATE to return next day sales 
															( relative to the dates you are using )
NEXTMONTH(date)											Use with CALCULATE to return next month sales 
															( relative to the dates you are using )
NEXTQUARTER (date)										Use with CALCULATE to return next quarter sales
															( relative to the dates you are using )
NEXTYEAR(date[,YE_date])								Use with CALCULATE to return next year sales 
															( relative to the dates you are using )
OPENINGBALANCEMONTH(expression, dates , [filter])		Evaluates an expression at the first date of a 
															month.
OPENINGBALANCEQUARTER(expression, dates , [filter])		Evaluates an expression at the first date of a 
															quarter.
OPENINGBALANCEYEAR(expression , dates , [[filter]])		Evaluates an expression for the first date of a
															year.
PARALLELPERIOD(date)									Returns a single column table of dates which 
															are parallel to the date column shifted by 
															specified number of intervals forward or 
															backward.
PREVIOUSDAY(date)										Use with CALCULATE to return previous day sales
PREVIOUSMONTH(date)										Use with CALCULATE to return previous month sales
PREVIOUSQUARTER(date)									Use with CALCULATE to return previous quarter sales
PREVIOUSYEAR(date)										Use with CALCULATE to return previous year sales
SAMEPERIODLASTYEAR(date)								Use with CALCULATE to return sales from last year.
STARTOFMONTH (date)										Returns the first day of the month
STARTOFQUARTER (date)									Returns the first day of the quarter
STARTOFYEAR(date,[YEAR])								Returns the first day of the year
TotalMTD(expression,dates,[filter])						Use with CALCULATE to return month to 
															date sales. (i.e see DATESMTD)
TotalQTD(expression,dates,[filter])						Use with CALCULATE to return quarter to date 
															sales. (i.e see DATESQTD)
TotalYTD(expression,dates,[filter])						Use with CALCULATE to return year to date 
															sales. (i.e see DATESYTD)
	
Small multiples in Power BI is a visualization technique that allows you to display multiple charts or visualizations side by side, each representing a subset of the data. This technique is particularly useful when you want to compare data across different categories or dimensions.

To create small multiples in Power BI, you can follow these steps:

Start by creating a single chart or visualization that represents your data.
Duplicate the chart by right-clicking on it and selecting "Duplicate."
Modify each duplicated chart to represent a different subset of your data. This can be achieved by applying filters, changing the visualizations' configurations, or adjusting the data fields used in each chart.
Repeat the duplication and modification process for as many subsets of data as you want to compare.
Arrange the charts side by side on your report canvas. You can align them manually or use Power BI's grid and snap-to-grid functionality to ensure they are evenly spaced.
Resize and format the charts as needed to improve readability and aesthetics.
If desired, you can synchronize the slicers or filters across all the charts to allow interactive filtering of the data.
By using small multiples, you can easily compare and analyze data patterns, trends, and insights across different dimensions or categories within a single Power BI report.

How to optimise Power BI Performance in Power BI
ChatGPT
To optimize Power BI performance in Power BI, you can follow several best practices and techniques. Here are some tips to help you improve the performance of your Power BI reports and dashboards:

Data Modeling:

Optimize your data model by reducing the number of tables and relationships where possible.
Use the "Import" data connectivity mode instead of "DirectQuery" or "Live Connection" to leverage Power BI's in-memory processing capabilities.
Remove unnecessary columns from your data model to reduce the data size and memory consumption.
Query Optimization:

Minimize the number of queries by consolidating multiple visuals into a single query.
Use query folding to push data transformations and filtering operations to the data source, reducing the amount of data imported into Power BI.
Avoid using complex or nested calculations in your queries, as they can slow down performance.
Enable query reduction by enabling the "Auto Date/Time" option in the Power Query Editor.
Data Loading and Refresh:

Schedule data refresh during off-peak hours to reduce the impact on system resources.
Use incremental refresh to load and refresh only the most recent or changed data, rather than reloading the entire dataset.
Optimize data source queries by ensuring that they are properly indexed and tuned for performance.
Monitor refresh performance using the Power BI Performance Analyzer to identify and resolve bottlenecks.
Report Design:

Minimize the number of visuals on a single page, as too many visuals can degrade performance.
Use slicers and filters to limit the data being displayed, reducing the amount of data processed.
Avoid using unnecessary visuals, such as large images or unnecessary background colors.
Use appropriate visual types for the data being presented, as some visuals may perform better than others.
Data Cardinality and Granularity:

Understand the data cardinality (the number of distinct values in a column) and granularity (the level of detail) of your data, and design your data model accordingly.
Avoid creating relationships between high-cardinality columns, as they can negatively impact performance.
Consider aggregating data at a higher granularity if detailed data is not necessary for your analysis.
Performance Monitoring and Optimization:

Use the Power BI Performance Analyzer to identify performance bottlenecks and optimize report performance.
Monitor memory and CPU usage to ensure your system has enough resources to handle the workload.
Regularly review and optimize DAX calculations and expressions to improve performance.
Remember that the specific optimizations required may vary based on your dataset, report complexity, and hardware infrastructure. It's essential to monitor and test the performance after implementing changes to assess their impact and make further adjustments if necessary.

	
	

	
