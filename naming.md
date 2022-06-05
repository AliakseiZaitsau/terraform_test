Naming convention 
=======
Azure resources
---------------------------

All resources must have such name format:  
**[environment]-[resource_type]-[app_name]-[padding]**  
Exception: you must remove hyphens from the name where resource types prohibit hyphens in the resource name by Azure policy.  
The maximum length of the resource name - 24 characters  

Description:  
 - **Enironment** - environment name can be **dev,qa and prod**
 - **resource_type** - names of all Azure resources must comply with the [Azure CAF naming convention](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
 - **app_name** - application name must be at least 3 and not more than 10 characters
 - **padding** - field with randomly generated characters up to maximum length of name  

Azure resource name example:  
**dev-rg-app1-bnedapjrmybs**

Terraform
---------------------------
- Variables must be in lower case, use "_" character instead of space, abbreviations are allowed
