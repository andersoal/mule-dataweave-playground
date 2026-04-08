
fun p(s: String = "p") = do {

  fun flattenObject(obj: Object, prefix: String = ""): Object =

    obj mapObject ((value, key) ->

      if (value is Object)

        flattenObject(value, prefix ++ key ++ ".")

      else

        {(prefix ++ key): value}
  )

  ---
  s as String match {

    case "property.property" -> "property.property"

    case "secure::property.property" -> "secure::property.property"

    else -> flattenObject(

      readUrl("classpath://properties.yaml", "application/yaml")
        as Object

    )[s] default s
  }

}