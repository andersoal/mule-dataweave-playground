%dw 2.9
output application/json
---
{
  payload: payload,
  attributes: attributes,
  vars: vars,
  error: error,
  correlationId: correlationId,
  p: Mule::p('example.hello'),
  secure: Mule::p('secure::example.secure.property.property'),
}