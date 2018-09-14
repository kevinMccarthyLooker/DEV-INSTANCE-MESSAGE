connection: "snowflake-dw"

# include: "*.view.lkml"                       # include all views in this project

#testing new pdt on new snowflage, and add label to highlight dev instance
include:"datapipeline_log_pdt_test.view.lkml"
explore: datapipeline_log_pdt_test  {
  hidden: no
  group_label: " **YOU ARE IN TEST**"
  label: " NOTE: Labels here (in explore dropdown) are tied to labels defined in smore_data project, but using them should invoke snowflake specific model files"
}
explore: datapipeline_log_pdt_test2  {
  hidden: no
  from: datapipeline_log_pdt_test
  group_label: " **YOU ARE IN TEST**"
  label: "-----------------------"
}
