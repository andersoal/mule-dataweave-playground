
fun p(s: String) = s as String match {
  case "property.property" -> "property.property"
  case "secure::property.property" -> "secure::property.property"
  else -> s
}