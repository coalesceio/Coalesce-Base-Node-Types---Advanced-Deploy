# Base Node Types Advanced Deploy

The Coalesce Base Node Types Package includes:

* [Work Advanced Deploy](#work-advanced-deploy)
* [Persistent Stage Advanced Deploy](#persistent-stage-advanced-deploy)
* [Dimension Advanced Deploy](#dimension-advanced-deploy)
* [Fact Advanced Deploy](#fact-advanced-deploy)
* [Factless Fact Advanced Deploy](#factless-fact-advanced-deploy)
* [Code](#code)

<h2 id="work-advanced-deploy">Work Advanced Deploy</h2>

The Coalesce work node is a versatile node that allows you to develop and deploy a Work table/view in Snowflake.

A Work node serves as an intermediary object and is commonly employed to store raw data before undergoing the crucial phases of transformation and loading into the main tables of the data warehouse.

This pivotal step ensures that the raw data is processed and structured effectively.

### Work Advanced Deploy Node Configuration

The Work node type has two configuration groups:

* [Node Properties](#work-advanced-deploy-node-properties)
* [Options](#work-advanced-deploy-options)

![Fact_config](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/45d22ea5-32ca-49f5-a464-b266cb29b516)


<h4 id="work-advanced-deploy-node-properties"> Work Advanced Deploy Node Properties</h4>

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.
    
<h4 id="work-advanced-deploy-options"> Work Advanced Deploy Options </h4>

You can create the node as:
* [Table](#work-advanced-deploy-options-table)
* [View](#work-advanced-deploy-options-view)
* [Transient Table](#work-advanced-deploy-options-transient)

<h5 id="work-advanced-deploy-options-table"> Table </h5>

* **Create As**: Table
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
	    * Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key
    * False: No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
	    * UNION: Combines with duplicate elimination.
	    * UNION ALL: Combines without duplicate elimination.
	    * INSERT: Runs an individual insert query for each source.
    * False - Single source node or multiple sources combined using a join.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task.
    * False - INSERT is used to append new data into target table.
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**: Any SQL to be executed post the data insert operation can be specified here.

<h5 id="work-advanced-deploy-options-view"> View </h5>

* **Create As**: View
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
	    * Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
	    * UNION: Combines with duplicate elimination.
	    * UNION ALL: Combines without duplicate elimination.
	    * INSERT: [Missing Content]
    * False - Single source node or multiple sources combined using a join.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible

<h5 id="work-advanced-deploy-options-transient"> Transient Table </h5>

* **Create As**: Transient Table
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
	    * Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key
    * False: No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
	    * UNION: Combines with duplicate elimination.
	    * UNION ALL: Combines without duplicate elimination.
	    * INSERT: Runs an individual insert query for each source.
    * False - Single source node or multiple sources combined using a join.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task.
    * False - INSERT is used to append new data into target table.
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**: Any SQL to be executed post the data insert operation can be specified here.



### Work Advanced Deploy Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

![work_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7acff10b-8845-4c44-851a-b7a0bc7eaf41)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Work Advanced Deploy Deployment

#### Work Advanced Deploy Initial Deployment
When deployed for the first time into an environment the Work node of materialization type table will execute the below stage:

**Create Work Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Work node of materialization type view will execute the below stage:

**Create Work View**
This will execute a CREATE OR REPLACE statement and create a view in the target environment.

#### Work Advanced Deploy Redeployment

After the WORK node with materialization type table/transient table/view has been deployed for the first time into a target environment, subsequent deployments may result in either altering the WORK Table or recreating the WORK table.

####   Altering the Work Tables and Transient Tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Work Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Work Advanced Deploy Recreating the Work Views

The subsequent deployment of Work node of materialization type view with changes in view definition,adding table description or renaming view results in deleting the existing view and recreating the view

The following stages are executed:

* **Create View**

#### Work Advanced Deploy  Drop and Recreate Work View/Table/Transient Table

When the materialization type of Work node is changed from View to table/transient table,the following stages are executed:

* **Drop view**
* **Create or Replace Work table/transient table**

When the materialization type of Work node is changed from table/transient table to View,the below stages are executed:

* **Drop table/transient table**
* **Create Work view**
  
When the materialization type of Work node is changed from table to transient table or transient table to table,the below stages are executed:

* **Drop table/transient table**
* **Create or Replace Work table/transient table**

> 📘 Materialization Work Node
>
> When the materialization type of Work node is changed from table/transient table to View and use Override Create SQL for view creation. This ensures that the following change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/0296abf8-0747-4ae8-8478-0782e5e2e545)

### Work Advanced Deploy Undeployment

If a Work Node of materialization type table/view/transient table are deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the WorkTable in the target environment will be dropped.

This is executed in below stage:

* **Drop table/view**


<h2 id="persistent-stage-advanced-deploy"> Persistent Stage Advanced Deploy </h2>

The Coalesce Persistent Stage Nodes element, serving as an intermediary object, is frequently utilized to maintain data persistence across multiple execution cycles.

It plays a crucial role in tracking the historical changes of columns linked to business keys.

This functionality is particularly beneficial when the objective is to retain raw data for prolonged durations.

### Persistent Stage Advanced Deploy Node Configuration
The Persistent node type has two configuration groups:

* [Node Properties](#persistent-stage-node-properties)
* [Options](#persistent-stage-options)

<h4 id="persistent-stage-node-properties"> Persistent Stage Advanced Deploy  Node Properties</h4>

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.

<h4 id="persistent-stage-options">Persistent Stage Advanced Deploy  Options </h4>

You can create the node as:
* [Table](#persistent-stage-options-table)
* [Transient Table](#persistent-stage-options-transient-table)

<h5 id="persistent-stage-options-table">Table </h5>

* **Create As**: Table
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Change tracking**: It is a required column for Type 2 .
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

<h5 id="persistent-stage-options-transient-table">Transient Table </h5>

* **Create As**: Table
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Change tracking**: It is a required column for Type 2 .
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

### Persistent Stage Advanced Deploy  Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

![pstage_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/4c3a4c11-b837-48d2-9ba9-1b0797a8aed9)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Persistent Stage Advanced Deploy  Deployment

#### Persistent Stage Advanced Deploy  Initial Deployment
When deployed for the first time into an environment the Persistent node will execute the below stage:

**Create Persistent Stage Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

#### Persistent Stage Advanced Deploy  Redeployment

After the Persistent node has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Persistent Table or recreating the Persistent table.

#### Altering the Persistent Tables/Transient Tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Persistent Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation accordingly

#### Drop and Recreate Persistent Stage Table/Transient Table
  
When the materialization type of Persistent stage node is changed from table to transient table or transient table to table,the below stages are executed

* **Drop table/transient table**
* **Create or Replace Persistent stage table/transient table**


### Persistent Stage Advanced Deploy Undeployment

If a Persistent Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Persistent Table in the target environment will be dropped.

This is executed in the stages:

* **Drop Table or View**

<h2 id="dimension-advanced-deploy"> Dimension Advanced Deploy</h2>

The Coalesce Dimension UDN is a versatile node that allows you to develop and deploy a Dimension table in Snowflake.

A dimension table or dimension entity is a table or entity in a star, snowflake, or starflake schema that stores details about the facts.Dimension tables describe the different aspects of a business process

### Dimension Advanced Deploy Node Configuration

* [Node Properties](#dimension-advanced-deploy-node-properties)
* [Options](#dimension-advanced-deploy-options)

<h4 id="dimension-advanced-deploy-node-properties">Dimension Advanced Deploy Node Properties</h4>

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.

<h4 id="dimension-advanced-deploy-options"> Dimension Advanced Deploy Dimension Options </h4>

You can create the node as:
* [Table](#dimension-advanced-deploy-options-table)
* [Transient Table](#dimension-advanced-deploy-options-transient)
* [View](#dimension-advanced-deploy-options-view)

<h5 id="dimension-advanced-deploy-options-table">Table </h5>

* **Create As**: Table
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Change tracking**: It is a required column for Type 2 .
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

<h5 id="dimension-advanced-deploy-options-transient">Transient Table </h5>

* **Create As**: Transient Table
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Change tracking**: It is a required column for Type 2 .
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

<h5 id="dimension-advanced-deploy-options-view"> View </h5>

* **Create As**: View
*  **Override Create SQL**:True/False that determines whether a customized Create SQL is required to be executed.
	* True - Customized Create SQL specified in the Create SQL space is executed.All other options are invisible.
	* False - Create view SQL based on the options chosen are framed and executed.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
	    * UNION: Combines with duplicate elimination.
	    * UNION ALL: Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible


###  Dimension Advanced Deploy Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI

![Dimension_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/d7f7dcc5-fe17-447c-9e6e-78fb1b8924ab)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Dimension Advanced Deploy Deployment

#### Dimension Advanced Deploy Initial Deployment
When deployed for the first time into an environment the Dimension node of materialization type table will execute the below stage:

**Create Dimension Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Dimension node of materialization type view will execute the below stage:

* **Create Dimension View**: This will execute a CREATE OR REPLACE statement and create a view in the target environment.

#### Dimension Advanced Deploy Redeployment

After the Dimension node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Dimension Table or recreating the Dimension table

#### Altering the Dimension Tables and Transient Tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Dimension Table in the target environment.

The following stages are executed

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Recreating the Dimension Views

The subsequent deployment of Dimension node of materialization type view with changes in view definition,adding table description or renaming view results in  recreating the dimension view

#### Drop and recreate Dimension View/Table/Transient

When the materialization type of Dimension node is changed from View to table/transient table,the following stages are executed:

* **Drop view**
* **Create Dimension table/transient table**

When the materialization type of Dimension node is changed from table/transient table to View,the following stages are executed:

* **Drop table/transient table**
* **Create Dimension view**
  
When the materialization type of Dimension node is changed from table to transient table or transient table to table,the following stages are executed:

* **Drop table/transient table**
* **Create Dimension table/transient table**

> 📘 Materialization type of Dimension node
>
> When the materialization type of Dimension node is changed from table/transient table to View and use Override Create SQL for view creation to ensure that the below change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/07bba9e6-802f-45d0-9a39-5f6bd619d53d)

### Dimension Advanced Deploy Undeployment

If a Dimension Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Dimension Table in the target environment will be dropped.

The stage executed:

* **Drop table/view**

<h2 id="fact-advanced-deploy"> Fact Advanced Deploy</h2>

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A fact table or a fact entity is a table or entity in a star or snowflake schema that stores measures that measure the business, such as sales, cost of goods, or profit. Fact tables and entities aggregate measures , or the numerical data of a business.

### Fact Advanced Deploy Node Configuration

* [Node Properties](#fact-advanced-deploy-node-properties)
* [Options](#fact-advanced-deploy-options)

<h4 id="fact-advanced-deploy-node-properties">Fact Advanced Deploy Node Properties</h4>

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.

<h4 id="fact-advanced-deploy-options"> Fact Advanced Deploy Dimension Options </h4>

You can create the node as:
* [Table](#fact-advanced-deploy-options-table)
* [Transient Table](#fact-advanced-deploy-options-transient)
* [View](#fact-advanced-deploy-options-view)

<h5 id="fact-advanced-deploy-options-table">Table </h5>

* **Create As**: Table
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

<h5 id="fact-advanced-deploy-options-transient">Transient Table </h5>

* **Create As**: Transient Table
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
		* **UNION** - Combines with duplicate elimination.
		* **UNION ALL** - Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not.
    * True -Allows you to specify the column based on which clustering is to be done.
		* Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key.
    * False: No clustering done.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing.
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing.
    * False- DISTINCT is visible.
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order.
    * True -Sort column and sort order drop down are visible and are required to form order by clause.
    * False-Sort column and sort order drop down are invisible.
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here.
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here.

<h5 id="fact-advanced-deploy-options-view"> View </h5>

* **Create As**: View
*  **Override Create SQL**:True/False that determines whether a customized Create SQL is required to be executed.
	* True - Customized Create SQL specified in the Create SQL space is executed.All other options are invisible.
	* False - Create view SQL based on the options chosen are framed and executed.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
	    * UNION: Combines with duplicate elimination.
	    * UNION ALL: Combines without duplicate elimination.
    * False - Single source node or multiple sources combined using a join.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible.
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible

### Fact Advanced Deploy Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/2f765410-67b4-437e-a281-6169901c382c)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Fact Advanced Deploy Deployment

#### Fact Advanced Deploy Initial Deployment
When deployed for the first time into an environment the Fact node of materialization type table will execute the below stage:

* **Create Fact Table**: This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Fact node of materialization type view will execute the below stage:

* **Create Fact View**: This will execute a CREATE OR REPLACE statement and create a view in the target environment.

#### Fact Advanced Deploy Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Fact Tables/Transient Tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Fact Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Recreating the Fact Advanced Deploy Views

The subsequent deployment of Fact node of materialization type view with changes in view definition,adding table description or renaming view results recreating the view

The following stages are executed: 

* **Create View**

### Fact Advanced Deploy Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in stages:

* **Drop table/view**

#### Drop and recreate Fact View/Table/Transient

When the materialization type of Fact node is changed from View to table/transient table,the following stages are executed:

* **Drop view**
* **Create Fact table/transient table**

When the materialization type of Fact node is changed from table/transient table to View,the following stages are executed:

* **Drop table/transient table**
* **Create Fact view**
  
When the materialization type of Fact node is changed from table to transient table or transient table to table, the following stages are executed:

* **Drop table/transient table**
* **Create Fact table/transient table**

> 📘 Materialization Type of Dimension node
>
> When the materialization type of Dimension node is changed from table/transient table to View and use Override Create SQL for view creation,ensure that the below change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7cf9e0a4-6832-452c-ba5e-cedad42d1c40)

<h2 id="factless-fact-advanced-deploy"> Factless Fact Advanced Deploy</h2>

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A factless fact table is used to record events or situations that have no measures, and it has the same level of detail as the dimensions

### Factless Fact Advanced Deploy Node Configuration

* [Node Properties](#factless-fact-advanced-deploy-node-properties)
* [Options](#factless-fact-advanced-deploy-factless-fact-options)

<h4 id="factless-fact-advanced-deploy-node-properties">Factless Fact Advanced Deploy Node Properties</h4>

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.


<h4 id="factless-fact-advanced-deploy-factless-fact-options">Factless Fact Advanced Deploy Options</h4>

![Factless_adv_deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/fd43869f-eba9-495a-b8c0-9f2c82c138e1)

* **Create As**:Provides option to choose materialization type.
	* Table
	* Transient Table
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task.
    * False - INSERT is used to append new data into target table.
* **Enable tests**: Provides option to specify tests in Testing section to check the data quality.
* **Distinct**: True/False toggle that determines whether to add DISTINCT to SQL Query.
    * True - Group by All is invisible. DISTINCT data is chosen for processing
    * False- Group by All is visible
* **Group by All**: True/False toggle that determines whether to add GROUP BY ALL to SQL Query.
    * True - DISTINCT is invisible. Data is grouped by all columns for processing
    * False- DISTINCT is visible
* **Order By** : True/False toggle that determines whether to add “ORDER BY” to SQL Query along with the column and sort order
    * True -Sort column and sort order drop down are visible and are required to form order by clause
    * False-Sort column and sort order drop down are invisible
* **Pre-SQL**: Any SQL to be executed as a predecessor to data insert operation can be mentioned here
* **Post-SQL**:Any SQL to be executed post the data insert operation can be specified here

  
### Factless Fact Advanced Deploy Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/e2d362ef-e34e-4153-910a-cc84a6a0ab4a)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Factless Fact Advanced Deploy Deployment

#### Factless Fact Advanced Deploy Initial Deployment
When deployed for the first time into an environment the Factless Fact node of materialization type table will execute the below stage:

* **Create Fact Table**: This will execute a CREATE OR REPLACE statement and create a table in the target environment.

#### Factless Fact Advanced Deploy Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Fact Tables/Transient Tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Factless fact Table in the target environment.

The following stages are executed

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation accordingly

#### Drop and recreate Factless Fact Table/Transient Table
  
When the materialization type of Factless Fact node is changed from table to transient table or transient table to table,the below stages are executed

* **Drop table/transient table**
* **Create Factless Fact table/transient table**

### Factless Fact Advanced Deploy Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in two stages:

* **Drop table/view**

## Code

### Work Advanced Deploy

* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/run.sql.j2)

### Persistent Stage Advanced Deploy

* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/run.sql.j2)

### Dimension Advanced Deploy

* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/run.sql.j2)

### Fact Advanced Deploy

* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/run.sql.j2)

### Factless Fact Advanced Deploy

* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/run.sql.j2)

[Macros](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/macros/macro-1.yml)


[<img src="https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/376a79f1-eced-4974-a307-f52ccb228a1e" alt="Git Logo" height="40">](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy)
