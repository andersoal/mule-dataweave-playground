/**
* This mapping won't be shared through your library, but you can use it to try out your module and create integration tests.
*/
%dw 2.9
output application/json
---
{
  payload: payload,
  attributes: attributes,
  vars: vars,
  error: error,
  correlationId: correlationId,
  p: Mule::p('p')
}