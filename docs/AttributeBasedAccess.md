# Tag Based Access

## Data Set Automatically classified by tag based policies

For large scale enterprises it would be beneficial for systems to be self sufficient and handle governance through automation. In order to achieve this tag based polices could be leveraged which automatically provides access to data , rather than having to wait for data owners to approve this manually.

This needs to be well though of since , it is debatable to have automated access granted without a gated intervention. This auto classification could be applied for semi sensitive and non sensitive data.

There are multiple options on different cloud vendors on how this can be achieved. For this hackathon , we will dive into [Azure Attribute Based Access Controls](https://docs.microsoft.com/en-us/azure/role-based-access-control/conditions-overview#:~:text=For%20more%20information%2C%20see%20Supplemental%20Terms%20of%20Use,principal%20access%20to%20a%20resource%20based%20on%20attributes.)

Coming back to our imaginary company which has it headquarters in West Europe , lets build the use case to get this into practise.

# Data sharing Between  Branches

This is a highly debatable topic , especially due to regulators which prevent data exchange between these continents ,however for this case , let us assume our company is a restaurant chain. Consider US to be the higher revenue maker for this company , due to which new products are first launched in this market. Europe Branch would like to launch a new restaurant and would like to know which would be the best location in terms of taste preferences , demographics , age group in the neighbourhood to decide where do they want to launch this menu.

For this scenario lets say the Customer Data (Aggregated) , Transaction and Store Locations are of Interest. The dataset which has be chosen is having Sensitive Data , Semi Sensitive Data and Non Sensitive Data. Lets look at this by a case by case prespective.

- Non Senstive Data Access 
- Semi Sensitive Data Access
- High Sensitive Data Access

### Non Senitive Data Access 

This scenario is to share data with least senstivity. Lets consider the data set Stores which has not so senstive information in it. Looking at the schema of stores , there is a store id , location field which pose not threat directly to a person or entity. Hence this can be classified as non sensitive, in our scenario let the tag name be  "NonSensitiveUS". To go ahead with this scenario , upload the file to a storage account in the US region which has been created by the [infra deployment script](/infra/main.bicep)

Looking at the storage of US , we have 3 containers , namely for finance , sales and stores. For this example the file is uploaded into the stores container
![Stores US](/docs/images/us-storage.PNG)

This is a two step approach :
- Scan the storage account to tag data sets 
- Assign tag to a group who is allowed to read this data , based on the tag 

#### Scan Storage Account to Tag data sets
Azure purview is used to scan the data set to automatically tag dataset based on the scan / classification rules set inside purview.Deploy the purivew instance using this [script](/infra/deployment.azcli)

Next we need to add the  US storage account into the purview data sources , so that the stores dataset is visible for scanning. Trigger the scan operation on the US storage account. In order to be able to scan the data , the Managed Identity needs to have Blob Reader access and also check firewall / related settings if you face any errors.

Two new Custom Classifications have been added to detect Non Sensitive US data. A new Classification rule is added to detect non sensitive US data. Last step is to define a new Scan Rule which includes the 2 new classifications which has been included in the previous step. 

![Classification](/docs/images/classification.PNG)

After the scan rule is run we will have the right classification done on the schema of the dataset.

![schema_class](/docs/images/schema_classification.PNG)

Assign this tag to the file which is stored in the storage account on the US side. This is for now a decoupled approach ( not fully automated) and is a semi automated . The first step is to  have a central list for classifications which have to be defined by the subsidiary.Let's consider the exhaustive list of classifications to be :

- Non Sensitive US
- Semi Sensitive US
- Highly Sensitive US

During the data load the file needs to be given the tag of "Non Sensitive US" data.
