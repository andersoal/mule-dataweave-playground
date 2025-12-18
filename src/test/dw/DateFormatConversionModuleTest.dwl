%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from DateFormatConversionModule

var date: DateTime = "2022-06-06T10:00:00" as DateTime
---
"DateFormatConversionModule" describedBy [
    "dateTimeConversion" describedBy [
        "It should do something" in do {
            dateTimeConversion(???, ???) must beObject()
        },
    ],
]
