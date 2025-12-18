%dw 2.9
output application/json
import dateTimeConversion from DateFormatConversionModule
---
dateTimeConversion(
  |2024-06-15T14:30:00Z|,
  "dd/MM/yyyy HH:mm:ss"
)