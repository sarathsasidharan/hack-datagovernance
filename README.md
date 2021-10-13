# Hack Data Governance
Garage Project  

## Data Goverenance 

Areas where data governance needs to be applied on a data lake 

1. Data Loading  
2. Data Preparation 
3. Data Model / Exposure ( Access Controls , tag based policies)


# Data Platform / Central Data Governance 


1. Data Loading (Raw Layer of the Domain / Company )
   
   - Always an owner attached to a dataset
   - Schema / Information of data inside needs to be present
   - Classification of data / Custom / Automated
   - Lineage upto the data creation ( Yes / No )
   - Access Controls (Read Only for other Departments or Domains to consume Data)


2. Data Preparation  ( Clean Layer of the Domain / Company)
  -  Transormation is recorded and updated ( Lineage ) 
  -  Data Quality is assured
  -  MDM is done at this region
  -  Access Controls for Teams to consume data ( Read only)

 

# Data Landing Zone Governance 

1. Data Loading  ,Metadata during load 
2. Data Preparation 
3. Data Model / Exposure ( Access Controls , tag based policies)
   - Access Controls on this layer are more fine grained for access to departments within the org for instance
   - This can be controlled centrally on an Landing Zone / Organization Level ( Or do we want this central, personal recom to go for Organization and push this data to the central team to function as a information rather than control to central team)


# Model for Centralized Data Governance 

![Central Data Management](/docs/images/Governance_Central.png)

In this model we envision a Central Data Governance Team which oversees the metadata and access on Individual subsidiaries. In this example we have a global team which has a central governance team which oversees 4 subsidiaries.

For this case there are 4 branches for a company which are namely USA , Europe , Middle East and South Asia

Although we have placed some products in there , the idea is to have a central catalog which acts as a bridge to transport metadata for other branches to access. The golden scenario which we foresee is that the tag based policies are in action. This would help to automatically control access for data sources at scale. 

Two access scenarios need to be supported in this model :

1. Data Sets are automatically classified and inherit the policies set at the central level.
2. Data Set access is explicitly requested and the data owner decides if the requestor can be granted access to data




