"""
Copyright 2019 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Parse the regression testlist in YAML format
"""

import yaml

def read_yaml(yaml_file):
  """ Read YAML file to a dictionary

  Args:
    yaml_file : YAML file

  Returns:
    yaml_data : data read from YAML in dictionary format
  """
  with open(yaml_file, "r") as f:
    try:
      yaml_data = yaml.safe_load(f)
    except yaml.YAMLError as exc:
      print(exc)
  return yaml_data


def process_regression_list(testlist, test, iterations, matched_list):
  """ Get the matched tests from the regression test list

  Args:
    testlist     : Regression test list
    test         : Test to run, "all" means all tests in the list
    iterations   : Number of iterations for each test

  Returns:
    matched_list : A list of matched tests
  """
  print("Processing regression test list : %s, test: %s" % (testlist, test))
  yaml_data = read_yaml(testlist)
  for entry in yaml_data:
    if (entry['test'] == test) or (test == "all"):
      if iterations > 0:
        entry['iterations'] = iterations
      print ("Found matched tests: %s, iterations:%0d" %
             (entry['test'], entry['iterations']))
      matched_list.append(entry)
