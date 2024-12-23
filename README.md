# this is my-terraform task folder
# commands 

$ terraform destroy -target="aws_instance.web"          ========it will delete specific resorce instance  for e.g  "aws_instance" "web"


===there are 4 data type numer,list,string and map 

we use data type variable for we except particula value for particular option  for. e.g for charecter ==string  we restrict user that you input value that that you shold specify coreect value in the form of string 

,list value should be according to specified vaibale  data type .


1)number :--used to set of number like if we specify number for.eg  instance=[1]





2)==list---it is used for list of string ,list of number for e.g if you set list of charecter you need to speicify  
type =list(string)    e.g ==instance name [abk,asb,and]

3)==string :-it is used for charecter where you specify charecter in variable .

===type =list(number) ===> it is used for list of number whee you specify multple numer of list e.g instance =[1,2,3]

4)==map ==it use to specify key with value for .e.g we specify multple variable  which can be string ,numbe,list with any value .
nembe=1234
 map[string]
name=[abhijit,ajit,ekesh]


============
index number start form =0
fore.g you need specify value from mulple vale you will type -[0,1,2,3]


when we cteate terraform infrastructure and init
tfstatefile created  used---it is a jason form file which is stoe infornnamtion regarding terraform resources  it keep track the resources that we created in terraform and store state of resources in the file .


============
count ==it is used to reate multple resorces from one resorce


================================================

data sorces ===is used to fetch information from data without hard coading for particular ami and thus we can create instance in any region .

type = used to define data typelike list[string],list[number],list[map]

default ===used set values like name = [webser-1", 'webser-2"]


dynamic _blocks ===used to convert repeatedely values into dynamics blocks value like securty group there are many port for ingress[inbound],and egress[outbound] which 

can we specify in dynamics blocks.


$ terraform validate --is used to check our code is valid or not

==============================
random_id ===is used to print uniq id for partucular resorce such as random password ,for bucket, any many more 

just we need to copy random provider ,and specify random lentgth ,and specify partucular random resource such as bucket .
