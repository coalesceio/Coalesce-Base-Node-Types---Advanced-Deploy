## Base Node Types Advanced Deploy

The Coalesce Base Node Types Package includes:

* [Work Advanced Deploy](#work-advanced-deploy)
* [Persistent Stage Advanced Deploy](#persistent-stage-advanced-deploy)
* [Dimension Advanced Deploy](#dimension-advanced-deploy)
* [Fact Advanced Deploy](#fact-advanced-deploy)
* [Factless Fact Advanced Deploy](#factless-fact-advanced-deploy)
* [Code](#code)

---

## Work Advanced Deploy

The Coalesce Work Node is a versatile node that allows you to develop and deploy a Work table/view in Snowflake.

A Work node serves as an intermediary object and is commonly employed to store raw data before undergoing the crucial phases of transformation and loading into the main tables of the data warehouse.

This pivotal step ensures that the raw data is processed and structured effectively.

### Work Advanced Deploy Node Configuration

The Work node type has two configuration groups:

* [Node Properties](#work-advanced-deploy-node-properties)
* [Options](#work-advanced-deploy-options)

![Fact_config](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/45d22ea5-32ca-49f5-a464-b266cb29b516)

#### Work Advanced Deploy Node Properties

| **Setting** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the WORK will be created |
| **Node Type** | Name of template used to create node objects |
| **Description** | A description of the node's purpose |
| **Deploy Enabled** | If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Work Advanced Deploy Options

You can create the node as:

* [Table](#work-advanced-deploy-create-as-table)
* [View](#work-advanced-deploy-create-as-view)
* [Transient Table](#work-advanced-deploy-create-as-transient-table)

##### Work Advanced Deploy Create as Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table|
| **Cluster key** | Toggle: True/False <br/> If the dimension is clustered or not. <br/> **True**: Allows you to specify the column based on which clustering is to be done.<br/>- **Allow Expressions Cluster Key**: Allows to add an expression to the specified cluster key<br/> **False**:No clustering done|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Work Advanced Deploy Create as View

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| View|
| **Cluster key** | Toggle: True/False <br/> If the dimension is clustered or not. <br/> **True**: Allows you to specify the column based on which clustering is to be done.<br/>- **Allow Expressions Cluster Key**: Allows to add an expression to the specified cluster key<br/> **False**:No clustering done|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |

##### Work Advanced Deploy Create as Transient Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Transient Table|
| **Cluster key** | Toggle: True/False <br/> If the dimension is clustered or not. <br/> **True**: Allows you to specify the column based on which clustering is to be done.<br/>- **Allow Expressions Cluster Key**: Allows to add an expression to the specified cluster key<br/> **False**:No clustering done|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

### Work Advanced Deploy Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

![work_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7acff10b-8845-4c44-851a-b7a0bc7eaf41)

> 📘 **Specify Group by and Order by Clauses**
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Work Advanced Deploy Deployment

#### Work Advanced Deploy Initial Deployment

When deployed for the first time into an environment the Work node of materialization type table or view will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Work Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |
| **Create Work View** | This will execute a CREATE OR REPLACE statement and create a view in the target environment |

#### Work Advanced Deploy Redeployment

After the WORK node with materialization type table/transient table/view has been deployed for the first time into a target environment, subsequent deployments may result in either altering the WORK Table or recreating the WORK table.

#### Altering the Work Tables and Transient Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

1. Changing table names
2. Dropping existing columns
3. Altering column data types
4. Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |

#### Work Advanced Deploy Recreating the Work Views

The subsequent deployment of Work node of materialization type view with changes in view definition, adding table description or renaming view results in deleting the existing view and recreating the view.

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Create View** | Creates a new view with updated definition |

#### Work Advanced Deploy Drop and Recreate Work View/Table/Transient Table

| **Change** | **Stages Executed** |
|------------|-------------------|
| **View to table/transient table** |  Drop view <br/> Create or Replace Work table/transient table |
| **Table/transient table to View** |  Drop table/transient table<br/> Create Work view |
| **Table to transient table or vice versa** |  Drop table/transient table<br/> Create or Replace Work table/transient table |

> 📘 **Materialization Work Node**
>
> When the materialization type of Work node is changed from table/transient table to View and use Override Create SQL for view creation. This ensures that the following change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/0296abf8-0747-4ae8-8478-0782e5e2e545)

### Work Advanced Deploy Undeployment

If a Work Node of materialization type table/view/transient table are deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the WorkTable in the target environment will be dropped.

This is executed in below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/view** | Removes the table or view from the environment |

---

## Persistent Stage Advanced Deploy

The Coalesce Persistent Stage Nodes element, serving as an intermediary object, is frequently utilized to maintain data persistence across multiple execution cycles.

It plays a crucial role in tracking the historical changes of columns linked to business keys.

This functionality is particularly beneficial when the objective is to retain raw data for prolonged durations.

### Persistent Stage Advanced Deploy Node Configuration

The Persistent node type has two configuration groups:

* [Node Properties](#persistent-stage-advanced-deploy-node-properties)
* [Options](#persistent-stage-advanced-deploy-options)

#### Persistent Stage Advanced Deploy Node Properties

| **Setting** | **Description** |
|----------|-------------|
| **Storage Location** | Storage Location where the WORK will be created |
| **Node Type** | Name of template used to create node objects |
| **Description** | A description of the node's purpose |
| **Deploy Enabled** |  If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Persistent Stage Advanced Deploy Options

You can create the node as:

* [Table](#persistent-stage-table)
* [Transient Table](#persistent-stage-transient-table)

##### Persistent Stage Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table|
| **Cluster key** | Toggle: True/False <br/> If the dimension is clustered or not. <br/> **True**: Allows you to specify the column based on which clustering is to be done.<br/>- **Allow Expressions Cluster Key**: Allows to add an expression to the specified cluster key<br/> **False**:No clustering done|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for both Type 1 and Type 2 |
| **Change tracking** | Required column for Type 2 |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Persistent Stage Transient Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table|
| **Cluster key** | Toggle: True/False <br/> If the dimension is clustered or not. <br/> **True**: Allows you to specify the column based on which clustering is to be done.<br/>- **Allow Expressions Cluster Key**: Allows to add an expression to the specified cluster key<br/> **False**:No clustering done|
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for both Type 1 and Type 2 |
| **Change tracking** | Required column for Type 2 |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

### Persistent Stage Advanced Deploy Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

![pstage_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/4c3a4c11-b837-48d2-9ba9-1b0797a8aed9)

> 📘 **Specify Group by and Order by Clauses**
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Persistent Stage Advanced Deploy Deployment

#### Persistent Stage Advanced Deploy Initial Deployment

When deployed for the first time into an environment the Persistent node will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Persistent Stage Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |

#### Persistent Stage Advanced Deploy Redeployment

After the Persistent node has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Persistent Table or recreating the Persistent table.

#### Altering the Persistent Tables/Transient Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

1. Changing table names
2. Dropping existing columns
3. Altering column data types
4. Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | ALTER table statement is executed to perform the alter operation accordingly |

#### Drop and Recreate Persistent Stage Table/Transient Table

When the materialization type of Persistent stage node is changed from table to transient table or transient table to table, the below stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/transient table** | Removes existing table |
| **Create or Replace Persistent stage table/transient table** | Creates new table with updated configuration |

### Persistent Stage Advanced Deploy Undeployment

If a Persistent Node is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Persistent Table in the target environment will be dropped.

This is executed in the stages:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop Table or View** | Removes the table from the environment |

---

## Dimension Advanced Deploy

The Coalesce Dimension UDN is a versatile node that allows you to develop and deploy a Dimension table in Snowflake.

A dimension table or dimension entity is a table or entity in a star, snowflake, or starflake schema that stores details about the facts. Dimension tables describe the different aspects of a business process.

### Dimension Advanced Deploy Node Configuration

* [Node Properties](#dimension-advanced-deploy-node-properties)
* [Options](#dimension-advanced-deploy-options)

#### Dimension Advanced Deploy Node Properties

| **Property** | Description |
|----------|-------------|
| **Storage Location** | Storage Location where the WORK will be created |
| **Node Type** | Name of template used to create node objects |
| **Description** | A description of the node's purpose |
| **Deploy Enabled** |  If TRUE the node will be deployed / redeployed when changes are detected<br/> If FALSE the node will not be deployed or will be dropped during redeployment |

#### Dimension Advanced Deploy Options

You can create the node as:

* [Table](#dimension-advanced-deploy-table)
* [Transient Table](#dimension-advanced-deploy-transient-table)
* [View](#dimension-advanced-deploy-view)

##### Dimension Advanced Deploy Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table|
| **Insert Zero Key Record** | Toggle: True/False<br/>Insert Zero Key Record to Dimention if enabled |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for Type 1 and Type 2 Dimensions |
| **Change tracking** | Required column for Type 2 Dimension |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Cluster key** | **True**: Allows you to specify the column based on which clustering is to be done<br/> Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key<br/>**False**: No clustering done |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Dimension Advanced Deploy Transient Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Transient Table |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for Type 1 and Type 2 Dimensions |
| **Change tracking** | Required column for Type 2 Dimension |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Cluster key** | **True**: Allows you to specify the column based on which clustering is to be done<br/> Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key<br/>**False**: No clustering done |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Dimension Advanced Deploy View

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| View |
| **Override Create SQL** | Toggle: True/False<br/>**True**: Custom Create SQL<br/>**False**: Generated view SQL |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for Type 1 and Type 2 Dimensions |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |

### Dimension Advanced Deploy Joins

Join conditions and other clauses can be specified in the join space next to mapping of columns in the UI.

![Dimension_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/d7f7dcc5-fe17-447c-9e6e-78fb1b8924ab)

> 📘 **Specify Group by and Order by Clauses**
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Dimension Advanced Deploy Deployment

#### Dimension Advanced Deploy Initial Deployment

When deployed for the first time into an environment the Dimension node of materialization type table or view will execute the following stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Dimension Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |
| **Create Dimension View** | This will execute a CREATE OR REPLACE statement and create a view in the target environment |

#### Dimension Advanced Deploy Redeployment

After the Dimension node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Dimension Table or recreating the Dimension table.

#### Altering the Dimension Tables and Transient Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

1. Changing table names
2. Dropping existing columns
3. Altering column data types
4. Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |

#### Recreating the Dimension Views

The subsequent deployment of Dimension node of materialization type view with changes in view definition, adding table description or renaming view results in recreating the dimension view.

#### Drop and Recreate Dimension View/Table/Transient

| **Change** | **Stages Executed** |
|------------|-------------------|
| **View to table/transient table** |  Drop view<br/> Create Dimension table/transient table |
| **Table/transient table to View** |  Drop table/transient table<br/> Create Dimension view |
| **Table to transient table or vice versa** |  Drop table/transient table<br/> Create Dimension table/transient table |

> 📘 **Materialization type of Dimension node**
>
> When the materialization type of Dimension node is changed from table/transient table to View and use Override Create SQL for view creation to ensure that the below change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/07bba9e6-802f-45d0-9a39-5f6bd619d53d)

### Dimension Advanced Deploy Undeployment

If a Dimension Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Dimension Table in the target environment will be dropped.

The stage executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/view** | Removes the table or view from the environment |

## Fact Advanced Deploy

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A fact table or a fact entity is a table or entity in a star or snowflake schema that stores measures that measure the business, such as sales, cost of goods, or profit. Fact tables and entities aggregate measures, or the numerical data of a business.

### Fact Advanced Deploy Node Configuration

* [Node Properties](#fact-advanced-deploy-node-properties)
* [Options](#fact-advanced-deploy-options)

#### Fact Advanced Deploy Node Properties

| **Setting** | **Description** |
|----------|-------------|
| **Storage Location**| Storage Location where the view will be created |
| **Node Type** | Name of template used to create node objects |
| **Description** | A description of the node's purpose |
| **Deploy Enabled**| If **TRUE**: node will be deployed/redeployed when changes are detected<br/>If **FALSE**: node will not be deployed or will be dropped during redeployment |

#### Fact Advanced Deploy Options

You can create the node as:

* [Table](#fact-advanced-deploy-table)
* [Transient Table](#fact-advanced-deploy-transient-table)
* [View](#fact-advanced-deploy-view)

##### Fact Advanced Deploy Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for Type 1 and Type 2 Dimensions |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Cluster key** | **True**: Allows you to specify the column based on which clustering is to be done<br/> Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key<br/>**False**: No clustering done |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Fact Advanced Deploy Transient Table

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Transient Table |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Business key** | Required column for Type 1 and Type 2 Dimensions |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Cluster key** | **True**: Allows you to specify the column based on which clustering is to be done<br/> Allow Expressions Cluster Key: Allows to add an expression to the specified cluster key<br/>**False**: No clustering done |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

##### Fact Advanced Deploy View

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| View |
| **Override Create SQL** | Toggle: True/False<br/>**True**: Executes custom Create SQL<br/>**False**: Creates view based on chosen options |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |

### Fact Advanced Deploy Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/2f765410-67b4-437e-a281-6169901c382c)

> 📘 **Specify Group by and Order by Clauses**
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Fact Advanced Deploy Deployment

#### Fact Advanced Deploy Initial Deployment

When deployed for the first time into an environment the Fact node of materialization type table will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Fact Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |
| **Create Fact View** | This will execute a CREATE OR REPLACE statement and create a view in the target environment |

#### Fact Advanced Deploy Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Fact Tables/Transient Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

1. Changing table names
2. Dropping existing columns
3. Altering column data types
4. Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation |

#### Recreating the Fact Advanced Deploy Views

The subsequent deployment of Fact node of materialization type view with changes in view definition, adding table description or renaming view results recreating the view.

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Create View** | Creates a new view with updated definition |

### Fact Advanced Deploy Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in stages:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/view** | Removes the table or view from the environment |

#### Drop and recreate Fact View/Table/Transient

| **Change** | **Stages Executed** |
|------------|-------------------|
| **View to table/transient table** |  Drop view<br/> Create Fact table/transient table |
| **Table/transient table to View** |  Drop table/transient table<br/> Create Fact view |
| **Table to transient table or vice versa** |  Drop table/transient table<br/> Create Fact table/transient table |

> 📘 **Materialization Type of Dimension node**
>
> When the materialization type of Dimension node is changed from table/transient table to View and use Override Create SQL for view creation, ensure that the below change is made in the stage function in Create SQL tab so that the order of deployment is maintained.

![CreateSQL](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/7cf9e0a4-6832-452c-ba5e-cedad42d1c40)

---

## Factless Fact Advanced Deploy

The Coalesce Fact UDN is a versatile node that allows you to develop and deploy a Fact table in Snowflake.

A factless fact table is used to record events or situations that have no measures, and it has the same level of detail as the dimensions.

### Factless Fact Advanced Deploy Node Configuration

* [Node Properties](#factless-fact-advanced-deploy-node-properties)
* [Options](#factless-fact-advanced-deploy-options)

#### Factless Fact Advanced Deploy Node Properties

| **Setting** | **Description** |
|----------|-------------|
| **Storage Location**| Storage Location where the view will be created |
| **Node Type** | Name of template used to create node objects |
| **Description** | A description of the node's purpose |
| **Deploy Enabled**| If **TRUE**: node will be deployed/redeployed when changes are detected<br/>If **FALSE**: node will not be deployed or will be dropped during redeployment |

#### Factless Fact Advanced Deploy Options

![Factless_adv_deploy](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/fd43869f-eba9-495a-b8c0-9f2c82c138e1)

| **Setting** | **Description** |
|---------|-------------|
| **Create As**| Table or Transient Table |
| **Multi Source** | Toggle: True/False<br/>Implementation of SQL UNIONs<br/>**True**: Combine multiple sources in a single node<br/>True Options:<br/>- **UNION**: Combines with duplicate elimination<br/>- **UNION ALL**: Combines without duplicate elimination<br/>- **INSERT**: Individual insert for each source<br/>**False**: Single source node or multiple sources combined using a join. |
| **Truncate Before** | Toggle: True/False<br/>This determines whether a table will be overwritten each time a task executes. **True**: Uses INSERT OVERWRITE<br/>**False**: Uses INSERT to append data |
| **Enable tests** | Toggle: True/False<br/>Determines if tests are enabled |
| **Distinct** | Toggle: True/False<br/>**True**: Group by All is invisible. DISTINCT data is chosen for processing.<br/>**False**: Group by All is visible. |
| **Group by All** | Toggle: True/False<br/>**True**: DISTINCT is invisible, data grouped by all columns<br/>**False**: DISTINCT is visible |
| **Order By** | Toggle: True/False<br/>**True**: Sort column and sort order drop down are visible and are required to form order by clause. <br/>**False**: Sort options invisible |
| **Pre-SQL**| SQL to execute before data insert operation |
| **Post-SQL** | SQL to execute after data insert operation |

### Factless Fact Advanced Deploy Joins

Join conditions and other clauses like where, qualify can be specified in the join space next to mapping of columns in the Coalesce app.

![fact_join](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/e2d362ef-e34e-4153-910a-cc84a6a0ab4a)

> 📘 **Specify Group by and Order by Clauses**
>
> Best Practice is to specify group by and order by clauses in this space if you are not opting for the group by all and order by provided in OPTIONS config.

### Factless Fact Advanced Deploy Deployment

#### Factless Fact Advanced Deploy Initial Deployment

When deployed for the first time into an environment the Factless Fact node of materialization type table will execute the below stage:

| **Stage** | **Description** |
|-----------|----------------|
| **Create Fact Table** | This will execute a CREATE OR REPLACE statement and create a table in the target environment |

#### Factless Fact Advanced Deploy Redeployment

After the Fact node of materialization type table has been deployed for the first time into a target environment, subsequent deployments may result in either altering the Fact Table or recreating the Fact table.

#### Altering the Factless Fact Tables/Transient Tables

A few types of column or table changes will result in an ALTER statement to modify the Persistent Table in the target environment, whether these changes are made individually or all together:

1. Changing table names
2. Dropping existing columns
3. Altering column data types
4. Adding new columns

The following stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Rename Table\| Alter Column \| Delete Column \| Add Column \| Edit table description** | Alter table statement is executed to perform the alter operation accordingly |

#### Drop and Recreate Factless Fact Table/Transient Table
  
When the materialization type of Factless Fact node is changed from table to transient table or transient table to table, the below stages are executed:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/transient table** | Removes existing table |
| **Create Factless Fact table/transient table** | Creates new table with updated configuration |

### Factless Fact Advanced Deploy Undeployment

If a Fact Node of materialization type table is deleted from a Workspace, that Workspace is committed to Git and that commit deployed to a higher level environment then the Fact Table in the target environment will be dropped.

This is executed in two stages:

| **Stage** | **Description** |
|-----------|----------------|
| **Drop table/view** | Removes the table or view from the environment |

## Code

### Work Advanced Deploy Code

| **Component** | **Link** |
|--------------|-----------|
| **Node definition** | [definition.yml](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/definition.yml) |
| **Create Template** | [create.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/create.sql.j2) |
| **Run Template** | [run.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/WorkAdvancedDeploy-179/run.sql.j2) |

### Persistent Stage Advanced Deploy Code

| **Component** | **Link** |
|--------------|-----------|
| **Node definition** | [definition.yml](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/definition.yml) |
| **Create Template** | [create.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/create.sql.j2) |
| **Run Template** | [run.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/PersistentStageAdvancedDeploy-180/run.sql.j2) |

### Dimension Advanced Deploy Code

| **Component** | **Link** |
|--------------|-----------|
| **Node definition** | [definition.yml](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/definition.yml) |
| **Create Template** | [create.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/create.sql.j2) |
| **Run Template** | [run.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/DimensionAdvancedDeploy-183/run.sql.j2) |

### Fact Advanced Deploy Code

| **Component** | **Link** |
|--------------|-----------|
| **Node definition** | [definition.yml](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/definition.yml) |
| **Create Template** | [create.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/create.sql.j2) |
| **Run Template** | [run.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactAdvancedDeploy-162/run.sql.j2) |

### Factless Fact Advanced Deploy Code

| **Component** | **Link** |
|--------------|-----------|
| **Node definition** | [definition.yml](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/definition.yml) |
| **Create Template** | [create.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/create.sql.j2) |
| **Run Template** | [run.sql.j2](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/nodeTypes/FactlessFactAdvancedDeploy-264/run.sql.j2) |

[Macros](https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/blob/main/macros/macro-1.yml)

<a href="https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy">
  <img 
    src="https://github.com/coalesceio/Coalesce-Base-Node-Types---Advanced-Deploy/assets/7216836/376a79f1-eced-4974-a307-f52ccb228a1e" 
    alt="Git Logo" 
    height="40" 
  />
</a>
