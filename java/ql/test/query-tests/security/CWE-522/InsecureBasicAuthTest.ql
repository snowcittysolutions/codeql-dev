import java
import semmle.code.java.security.InsecureBasicAuthQuery
import TestUtilities.InlineExpectationsTest

class HasInsecureBasicAuthTest extends InlineExpectationsTest {
  HasInsecureBasicAuthTest() { this = "HasInsecureBasicAuthTest" }

  override string getARelevantTag() { result = "hasInsecureBasicAuth" }

  override predicate hasActualResult(Location location, string element, string tag, string value) {
    tag = "hasInsecureBasicAuth" and
    exists(DataFlow::Node sink | InsecureBasicAuthFlow::flowTo(sink) |
      sink.getLocation() = location and
      element = sink.toString() and
      value = ""
    )
  }
}
