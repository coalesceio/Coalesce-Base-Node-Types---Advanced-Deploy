# Coalesce Base Node Types Package - Advanced Deploy

The Coalesce Base Node Types Package includes:

* [Work Advanced Deploy](#work-adavanced-deploy)
* [Persistent Stage Advanced Deploy](#persistent-stage-advanced-deploy)
* [Dimension Advanced Deploy](#dimension-advanced-deploy)
* [Fact Advanced Deploy](#fact-advanced-deploy)
* [Factless Fact Advanced Deploy](#factless-fact-advanced-deploy)
* [Code](#code)

# Work Advanced Deploy

The Coalesce work node is a versatile node that allows you to develop and deploy a Work table/view in Snowflake.

A Work node serves as an intermediary object and is commonly employed to store raw data before undergoing the crucial phases of transformation and loading into the main tables of the data warehouse.

This pivotal step ensures that the raw data is processed and structured effectively.

## Node Configuration

The Work node type has two configuration groups:

* [Node Properties](#node-properties)
* [Options](#options)

![Fact_config](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/45d22ea5-32ca-49f5-a464-b266cb29b516)

### Node Properties

There are four configs within the **Node Properties** group.

* **Storage Location**: Storage Location where the WORK will be created.
* **Node Type**: Name of template used to create node objects.
* **Description**: A description of the node's purpose.
* **Deploy Enabled**:
  * If TRUE the node will be deployed / redeployed when changes are detected.
  * If FALSE the node will not be deployed or will be dropped during redeployment.
    
### Options

Materialization Type:table/transient table

![Work_Advanced_Deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/1c14e50c-5d29-49e6-a8f5-bf1c0c261fbc)

Materialization type:View

![Work_options_view1](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/b0937a52-3db1-4c7b-8db4-cf4ee56ce97a)

There are many configs within the **Options** group.

* **Create As**:Provides option to choose materialization type as ‘table’ or ‘view’
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not
    * True -Allows you to specify the column based on which clustering is to be done.
            -Allow Expressions Cluster Key-True ->allows to add an expression to the specified cluster key
    * False – No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
* **Enable tests**:
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
* **Post-SQL**: Any SQL to be executed post the data insert operation can be specified here

#### Multi Source False

![Fact_multi_false](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/c573afba-b4d1-4b79-b244-1291cf6258aa)

#### Multi Source True

When Multi Source is set to true an additional option for Multi Source Strategy is required. In the case of a WORK there are two options:

* **UNION**: Combines with duplicate elimination.
* **UNION ALL**: Combines without duplicate elimination.

![Pstage_multi_true](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/b932e5a6-e024-4813-926b-02c4c8941b9e)

## Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI

![work_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7acff10b-8845-4c44-851a-b7a0bc7eaf41)

Note:It is ideal to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config

## Deployment

### Initial Deployment
When deployed for the first time into an environment the Work node of materialization type table will execute the below stage:

**Create Work Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Work node of materialization type view will execute the below stage:

**Create Work View**
This will execute a CREATE OR REPLACE statement and create a view in the target environment.

### Redeployment

After the WORK node with materialization type table/transient table/view has been deployed for the first time into a target environment, subsequent deployments may result in either altering the WORK Table or recreating the WORK table.

#### Altering the Work tables/transient tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Work Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Recreating the Work views

The subsequent deployment of Work node of materialization type view with changes in view definition,adding table description or renaming view results in deleting the existing view and recreating the view

The following stages are executed:

* **Create View**

#### Drop and recreate Work view/table/transient table

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


### Undeployment

If a Work Node of materialization type table/view/transient table are deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the WorkTable in the target environment will be dropped.

This is executed in below stage:

* **Drop table/view**

# PERSISTENT STAGE ADVANCED DEPLOY

The Coalesce Persistent Stage Nodes element, serving as an intermediary object, is frequently utilized to maintain data persistence across multiple execution cycles.

It plays a crucial role in tracking the historical changes of columns linked to business keys.

This functionality is particularly beneficial when the objective is to retain raw data for prolonged durations.

## Node Configuration
The Persistent node type has two configuration groups:

* [Node Properties](#node-properties)
* [Options](#persistent-stage-options)

### Persistent stage Options

There are many configs within the **Options** group.

![Pstage_adv_deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/85e8ed78-9bd3-4b13-9fa2-b4381d8b1df8)


* **Create As**:Provides option to choose materialization type as ‘table’
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not
    * True -Allows you to specify the column based on which clustering is to be done.
            -Allow Expressions Cluster Key-True ->allows to add an expression to the specified cluster key
    * False – No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2.
* **Change tracking**: It is a required column for Type 2 .
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
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

#### Multi Source False

![Fact_multi_false](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/e51e0e9d-85de-4a5e-988b-fceb23dfe05c)

#### Multi Source True

When Multi Source is set to true an additional option for Multi Source Strategy is required. In the case of a Persistent there are two options:

* **UNION** - Combines with duplicate elimination.
* **UNION ALL** - Combines without duplicate elimination.
  
![Pstage_multi_true](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/c8b78f2f-5356-42b3-97c9-0f0bc9bac902)

## Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI

![pstage_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/4c3a4c11-b837-48d2-9ba9-1b0797a8aed9)

Note:It is ideal to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config

## Deployment

### Initial Deployment
When deployed for the first time into an environment the Persistent node will execute the below stage:

**Create Persistent Stage Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

### Redeployment

After the Persistent node has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Persistent Table or recreating the Persistent table.

#### Altering the Persistent tables/transient tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Persistent Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation accordingly

#### Drop and recreate Persistent stage table/transient table 
  
When the materialization type of Persistent stage node is changed from table to transient table or transient table to table,the below stages are executed

* **Drop table/transient table**
* **Create or Replace Persistent stage table/transient table**


### Undeployment

If a Persistent Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Persistent Table in the target environment will be dropped.

This is executed in the stages:

* **Drop Table or View**

# DIMENSION ADVANCED DEPLOY

The Coalesce Dimension UDN is a versatile node that allows you to develop and deploy a Dimension table in Snowflake.

A dimension table or dimension entity is a table or entity in a star, snowflake, or starflake schema that stores details about the facts.Dimension tables describe the different aspects of a business process

## Node Configuration
The Dimension node type has two configuration groups:

* [Node Properties](#node-properties)
* [Options](#dimension-options)

### Dimension Options

There are many configs within the **Options** group.

Materialization type:Table/Transient Table

![Dimension-advanced-deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/113f777e-a919-4939-8143-7a1070863def)

Materialization type:View

![Work_options_view1](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/8a4af021-3965-44cf-8fd0-4fc6b0f846f8)

* **Create As**:Provides option to choose materialization type as ‘table’ or ‘view’
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not
    * True -Allows you to specify the column based on which clustering is to be done.
            -Allow Expressions Cluster Key-True ->allows to add an expression to the specified cluster key
    * False – No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for both Type 1 and Type 2 Dimensions.
* **Change tracking**: It is a required column for Type 2 Dimension.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
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

#### Multi Source False

![Fact_multi_false](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7a9bcdbd-b3a0-4419-890d-9f19e3264832)

#### Multi Source True

![Fact_multi_true](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/54546b6f-994a-473c-b052-5482979be2a5)

When Multi Source is set to true an additional option for Multi Source Strategy is required. In the case of a Dimension there are two options:

* **UNION** - Combines with duplicate elimination.
* **UNION ALL** - Combines without duplicate elimination.

## Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI

![Dimension_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/d7f7dcc5-fe17-447c-9e6e-78fb1b8924ab)

> 📘 Specify Group by and Order by Clauses
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

## Deployment

### Initial Deployment
When deployed for the first time into an environment the Dimension node of materialization type table will execute the below stage:

**Create Dimension Table**
This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Dimension node of materialization type view will execute the below stage:

* **Create Dimension View**: This will execute a CREATE OR REPLACE statement and create a view in the target environment.

### Redeployment

After the Dimension node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Dimension Table or recreating the Dimension table

#### Altering the Dimension tables/transient tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Dimension Table in the target environment.

The following stages are executed

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Recreating the Dimension views

The subsequent deployment of Dimension node of materialization type view with changes in view definition,adding table description or renaming view results in  recreating the dimension view

#### Drop and recreate Dimension view/table/transient

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

### Undeployment

If a Dimension Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Dimension Table in the target environment will be dropped.

The stage executed:

* **Drop table/view**

# FACT ADVANCED DEPLOY

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A fact table or a fact entity is a table or entity in a star or snowflake schema that stores measures that measure the business, such as sales, cost of goods, or profit. Fact tables and entities aggregate measures , or the numerical data of a business.

## Node Configuration
The Fact node type has two configuration groups:

* [Node Properties](#node-properties)
* [Options](#fact-options)

### Fact Options

There are many configs within the **Options** group.

Materialization type:Table/Transient Table

![Fact_advanced_deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/1514745e-c35a-4a07-bccd-a0ba971ab269)

Materialization type:View

![Work_options_view1](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/98c4571a-bf0e-49b8-8dfb-58040b67763c)

* **Create As**:Provides option to choose materialization type as ‘table’ or ‘view’
* **Cluster key**: True/False to determine whether Dimension is to be clustered or not
    * True -Allows you to specify the column based on which clustering is to be done.
            -Allow Expressions Cluster Key-True ->allows to add an expression to the specified cluster key
    * False – No clustering done
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Business key**: It is a required column for Fact table creation.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
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

#### Multi Source False

![Fact_multi_false](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/5ffd8b8d-4a3e-49f0-b77c-a7671b8ac045)

#### Multi Source True

![Pstage_multi_true](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/ca925f7d-924e-4772-b9dd-6e11875f0037)

When Multi Source is set to true an additional option for Multi Source Strategy is required. In the case of a Fact node type there are two options:

* **UNION** - Combines with duplicate elimination.
* **UNION ALL** - Combines without duplicate elimination.

## Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/2f765410-67b4-437e-a281-6169901c382c)

Note:if you are not opting for the group by all and order by provided in OPTIONS config,it is ideal to specify group by and order by clauses in this space.

## Deployment

### Initial Deployment
When deployed for the first time into an environment the Fact node of materialization type table will execute the below stage:

* **Create Fact Table**: This will execute a CREATE OR REPLACE statement and create a table in the target environment.

When deployed for the first time into an environment the Fact node of materialization type view will execute the below stage:

* **Create Fact View**: This will execute a CREATE OR REPLACE statement and create a view in the target environment.

### Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Fact tables/transient tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Fact Table in the target environment.

The following stages are executed:

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation.

#### Recreating the Fact views

The subsequent deployment of Fact node of materialization type view with changes in view definition,adding table description or renaming view results recreating the view

The following stages are executed: 

* **Create View**

### Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in stages:

* **Drop table/view**

#### Drop and recreate Fact view/table/transient

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

# FACTLESS FACT ADVANCED DEPLOY

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A factless fact table is used to record events or situations that have no measures, and it has the same level of detail as the dimensions

## Node Configuration
The Fact node type has two configuration groups:

* [Node Properties](#node-properties)
* [Options](#factless-fact-options)

### Factless fact Options

There are many configs within the **Options** group.

**Materialization type**:Table/Transient Table

![Factless_adv_deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/fd43869f-eba9-495a-b8c0-9f2c82c138e1)

* **Create As**:Provides option to choose materialization type as ‘table’.
* **Multi Source**: True / False toggle that is Coalesce implementation of SQL UNIONs.
    * True - Multiple sources can be combined in a single node. The sources are combined using the option specified in the Multi Source Strategy.
    * False - Single source node or multiple sources combined using a join.
* **Truncate Before**: True / False toggle that determines whether or not a table is overwritten each time a task executes.
    * True - INSERT OVERWRITE is used to overwrite existing data with new data loaded by task
    * False - INSERT is used to append new data into target table
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

#### Multi Source False

![Fact_multi_false](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/d2395ba5-40d4-4330-8b35-4c62fe000a38)

#### Multi Source True

![Fact_multi_true](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/f1268e9c-bf46-4e08-bcf1-d67038a0f03b)

When Multi Source is set to true an additional option for Multi Source Strategy is required. In the case of a Fact node type there are two options:

* **UNION** - Combines with duplicate elimination.
* **UNION ALL** - Combines without duplicate elimination.
  
## Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/e2d362ef-e34e-4153-910a-cc84a6a0ab4a)

Note:if you are not opting for the group by all and order by provided in OPTIONS config,it is ideal to specify group by and order by clauses in this space.

## Deployment

### Initial Deployment
When deployed for the first time into an environment the Factless Fact node of materialization type table will execute the below stage:

* **Create Fact Table**: This will execute a CREATE OR REPLACE statement and create a table in the target environment.

### Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Fact tables/transient tables

There are few column or table changes like Change in table name,Dropping existing column, Alter Column data type,Adding a new column if made in isolation or all-together will result in an ALTER statement to modify the Factless fact Table in the target environment.

The following stages are executed

* **Rename Table| Alter Column | Delete Column | Add Column | Edit table description**: Alter table statement is executed to perform the alter operation accordingly

#### Drop and recreate Factless Fact table/transient table
  
When the materialization type of Factless Fact node is changed from table to transient table or transient table to table,the below stages are executed

* **Drop table/transient table**
* **Create Factless Fact table/transient table**

### Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in two stages:

* **Drop table/view**

# Code

## Work Advanced Deploy
* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/run.sql.j2)

## Persistent stage Advanced Deploy
* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/run.sql.j2)

## Dimension Advanced Deploy
* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/run.sql.j2)

## Fact Advanced Deploy
* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/run.sql.j2)

## Factless Fact Advanced Deploy
* [Node definition](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/definition.yml)
* [Create Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/create.sql.j2)
* [Run Template](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/run.sql.j2)
