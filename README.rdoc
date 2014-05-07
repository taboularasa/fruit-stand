# when to use a form object

- multi-model forms wihout a clear parent model (consider nested attributes if there is a clear object hierarchy)
- multiple interfaces
- operating on same object in differnet ways
- you find the need for conditional validations in models

# pros

- better controll over the attributes that your form collects
- better adapt to complicated UI

# cons

- nested forms boilerplate
- duplication (validations, attributes)

