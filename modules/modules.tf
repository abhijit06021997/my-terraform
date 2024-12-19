 module "user" {                            #we created module with any name but we gave real path for resource craeting in module folder ,we create module in main folder and sprcify resorces in module directoy
  source = "./modules"

}
