# 🎮 DataWeave Playground

> A local, version-controlled alternative to the [MuleSoft DataWeave Playground](https://dataweave.mulesoft.com/learn/playground) — develop, test, and share DataWeave transformations offline!

![DataWeave Version](https://img.shields.io/badge/DataWeave-2.9.0-blue)
![Maven](https://img.shields.io/badge/Maven-dw--library-green)
![Version](https://img.shields.io/badge/Version-1.0.0--SNAPSHOT-orange)

---

## 📖 Table of Contents

- [✨ Features](#-features)
- [🚀 Getting Started](#-getting-started)
- [📁 Project Structure](#-project-structure)
- [🎯 Playground Workflow](#-playground-workflow)
- [📦 Available Modules](#-available-modules)
- [🧪 Testing](#-testing)
- [🔍 Live Preview](#-preview-like-playground)
- [🎯 Usage Examples](#-usage-examples)
- [🏗️ Creating New Modules](#️-creating-new-modules)
- [📚 Documentation Standards](#-documentation-standards)
- [🌐 Publishing to Exchange](#-publishing-to-exchange)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🔗 Resources](#-resources)

---

## ✨ Features

| Feature                                             | Online Playground | This Project |
| --------------------------------------------------- | ----------------- | ------------ |
| 🔌 Offline Development                              | ❌               | ✅           |
| 📂 Version Control (Git)                            | ❌               | ✅           |
| 🤖 AI (Copilot, Claude, Antigravity, etc)           | ❌               | ✅           |
| 🔄 CI/CD Integration                                | ❌               | ✅           |
| 💻 Full IDE Support                                 | ❌               | ✅           |
| 📦 Reusable Module Libraries                        | ❌               | ✅           |
| 🏢 Enterprise Formats (Excel, FlatFile, Avro)       | ❌               | ✅           |
| 🚀 Publish to Exchange                              | ❌               | ✅           |
| 🧪 Automated Unit Testing                           | ❌               | ✅           |
| ⚡ Quick Experimentation                             | ✅               | ✅           |
| 🛠️ Custom Module Creation                           | ✅               | ✅           |
| 🎮 Mimics Online Playground Experience              | ✅               | ✅           |
| 🆓 Free and Open Source                             | ✅               | ✅           |

<div align="right"><a href="#-table-of-contents">⬆️️️️ Back to Top</a></div>

---

## 🚀 Getting Started

### Prerequisites

- ☕ **Java 8+** (JDK installed and `JAVA_HOME` configured)
    - You can also use tools to manage multiple JDK versions:
    - [scoop](https://github.com/ScoopInstaller/Java)
    - [SDKMAN](https://sdkman.io/)
    - [jabba](https://github.com/shyiko/jabba)
- 📦 **Maven 3.6+**
  - You can also use [scoop](https://scoop.sh/) to manage multiple versions.
  - ([Download](https://maven.apache.org/download.cgi))
- 🛠️ **IDE** (VS Code with Anypoint Code Builder recommended)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/andersoal/mule-dataweave-playground
   cd mule-dataweave-playground
   ```

<div align="right"><a href="#-table-of-contents">⬆️️️️ Back to Top</a></div>

---

## 📁 Project Structure

```
playground/
├── 📄 pom.xml                          # Maven configuration
├── 📄 README.md                        # You are here!
└── src/
    ├── main/
    │   ├── dw/                         # 📦 Reusable modules and the playground entrypoint
    │   │   ├── DateFormatConversionModule.dwl
    │   │   ├── Mule.dwl
    │   │   └── main.dwl               # 🎮 Current playground-style script
    │   └── resources/                  # 📂 Additional resources
    └── test/
        ├── dw/                         # 🧪 Assertion-based DataWeave tests
        │   └── DateFormatConversionModuleTest.dwl
        └── resources/                                  # 📥 Test input data
            ├── DateFormatConverstionModuleMapping/
            │   └── Playground/
            │       └── inputs/
            │           └── payload.json
            └── main/
                └── Playground/
                    └── inputs/
                        ├── attributes.dwl
                        ├── correlationId.dwl
                        ├── error.dwl
                        ├── payload.dwl
                        └── vars.dwl
```

## 🎯 Playground Workflow

This repository currently uses [src/main/dw/main.dwl](src/main/dw/main.dwl) as the closest equivalent to the online DataWeave playground.

| Online Playground | Local Project |
| ----------------- | ------------- |
| Main Editor Panel | `src/main/dw/main.dwl` |
| Reusable snippets | `src/main/dw/*.dwl` modules |
| Input Panel | `src/test/resources/main/Playground/inputs/` |
| Output Panel | **DataWeave: Run Preview** or Maven test output |

The test resources under `src/test/resources/main/Playground/inputs/` provide sample `payload`, `attributes`, `vars`, `error`, and `correlationId` values that mirror the objects available in the hosted playground experience.

### 🧭 Current Development Flow

1. Edit `src/main/dw/main.dwl` for quick experiments.
2. Use `Mule::p(...)` from `Mule.dwl` when you need mock property access.
3. Move reusable logic into dedicated modules under `src/main/dw/`.
4. Add assertion-based tests under `src/test/dw/` when logic needs regression coverage.

### 🎯 How It Mirrors the Online Playground

| Online Playground | Local Project                                     |
| ----------------- | ------------------------------------------------- |
| Quick experimentation | `src/main/dw/main.dwl` + preview inputs |
| Reusable modules | `src/main/dw/*.dwl` |
| Automated validation | `src/test/dw/*.dwl` unit tests |
| Auto Preview with DataWeave Extension | Use **DataWeave: Enable Auto Preview** in VS Code |


<div align="right"><a href="#-table-of-contents">⬆️️️️ Back to Top</a></div>

---

## 📦 Available Modules

### 📅 DateFormatConversionModule

**Location:** `src/main/dw/DateFormatConversionModule.dwl`

Utilities for date and time formatting conversions.

<details>
<summary>Function Documentation Example</summary>

#### Functions

| Function | Description |
|----------|-------------|
| `dateTimeConversion(dateTime, dateTimeFormat)` | Converts a `DateTime` to a formatted string |

#### Example Usage

```js,dw,dataweave
%dw 2.0
import dateTimeConversion from DateFormatConversionModule
output application/json
---
{
    original: now(),
    formatted: dateTimeConversion(now(), "dd/MM/yyyy HH:mm:ss"),
    dateOnly: dateTimeConversion(now(), "yyyy-MM-dd"),
    timeOnly: dateTimeConversion(now(), "hh:mm:ss a")
}
```

**Output:**
```json
{
  "original": "2026-01-16T10:30:00Z",
  "formatted": "16/01/2026 10:30:00",
  "dateOnly": "2026-01-16",
  "timeOnly": "10:30:00 AM"
}
```
</details>

---


### 🔧 Mule

**Location:** `src/main/dw/Mule.dwl`

Utilities for Mule runtime property access simulation.

#### Functions

| Function | Description |
|----------|-------------|
| `p(s)` | Resolves a property value from `properties.yaml` or returns the provided key |

<div align="right"><a href="#-table-of-contents">⬆️️️️ Back to Top</a></div>

---

### 🎮 main.dwl

**Location:** `src/main/dw/main.dwl`

This is the current playground entrypoint for local experimentation. It emits the same runtime-style objects that are commonly explored in the online playground and demonstrates property lookup through `Mule::p(...)`.

#### What it shows

| Field | Description |
|-------|-------------|
| `payload` | Current payload input |
| `attributes` | Current attributes input |
| `vars` | Current variables input |
| `error` | Current error input |
| `correlationId` | Current correlation id input |
| `p` | Example property lookup via `Mule::p("example.hello")` |
| `secure` | Example secure property lookup via `Mule::p("secure::example.secure.property.property")` |

#### Example Usage

```js,dw,dataweave
%dw 2.9
output application/json
---
{
    payload: payload,
    attributes: attributes,
    vars: vars,
    error: error,
    correlationId: correlationId,
    p: Mule::p("example.hello"),
    secure: Mule::p("secure::example.secure.property.property")
}
```

<div align="right"><a href="#-table-of-contents">⬆️️️ Back to Top</a></div>

---

## 🧪 Testing

<details>
<summary><strong>🧪 Testing Strategies</strong></summary>

This project currently supports **two complementary workflows**:

### 1️⃣ Interactive Playground Workflow

Use `src/main/dw/main.dwl` together with the fixtures in `src/test/resources/main/Playground/inputs/` for fast local experiments and preview-driven development.

**Structure:**
```
src/main/dw/main.dwl                  # Playground-style transformation
src/test/resources/main/
    └── Playground/
        └── inputs/
            ├── payload.dwl           # Test payload
            ├── attributes.dwl        # Mock attributes
            ├── vars.dwl              # Mock variables
            ├── error.dwl             # Mock error object
            └── correlationId.dwl     # Mock correlation id
```

Use **DataWeave: Run Preview** in VS Code to execute the script against those inputs.

### 2️⃣ Unit Tests (Testing Framework)

Use the DataWeave Testing Framework for assertion-based regression tests.

**Example:** `DateFormatConversionModuleTest.dwl`
```js,dw,dataweave
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from DateFormatConversionModule

var date: DateTime = "2022-06-06T10:00:00" as DateTime
---
"DateFormatConversionModule" describedBy [
    "dateTimeConversion" describedBy [
        "It should convert DateTime to specified format" in do {
            dateTimeConversion(date, "dd-MM-yyyy") must equalTo("06-06-2022")
        },
    ]
]
```

The repository also contains fixture data under `src/test/resources/DateFormatConverstionModuleMapping/Playground/inputs/` that can be used as a starting point for mapping-style experiments when you add new executable scripts.

### 🏃 Running Tests

| Command                     | Description               |
| --------------------------- | ------------------------- |
| `mvn test`                  | Run all tests             |
| `mvn test -Dtest=DateFormatConversionModuleTest` | Run the current unit test |
| `mvn clean test`            | Clean and run all tests   |

### 📊 Test Reports

After running tests, HTML reports are automatically generated:

```
target/data-weave-test-reports/
    └── data-weave-testing-framework-summary.html
```

Open the HTML file in your browser to view:
- ✅ Test results summary (passed, failed, ignored)
- ⏱️ Execution time for each test
- 📝 Detailed test output and assertions
- 🔍 Error messages and stack traces (if any)

</details>

---

### 🔍 Preview like Playground

<details>
<summary><strong>🔍 Real-Time Preview with VS Code (DataWeave Extension)</strong></summary>

The **Anypoint Code Builder** extension for VS Code provides real-time preview capabilities for DataWeave mappings.

In this repository, the primary preview target is `src/main/dw/main.dwl`.

#### Prerequisites

- 🔧 [Anypoint Code Builder - DataWeave Extension](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-data-weave-client) extension installed or [Anypoint Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-extension-pack)
- 📄 Input files configured for the script you want to preview. In this repository, the primary playground inputs live under `src/test/resources/main/Playground/inputs/`.

#### Features

| Feature | Description |
|---------|-------------|
| **DataWeave: Run Preview** | Execute your mapping and view output in real-time |
| **DataWeave: Enable Auto Preview** | Automatically runs preview on every file save |
| **Preview Output Panel** | See transformation results instantly without running full Maven tests |

#### How to Use

##### 1️⃣ Manual Preview (DataWeave: Run Preview)

1. Open `src/main/dw/main.dwl`
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) to open the Command Palette
3. Type **"DataWeave: Run Preview"** and press Enter
4. The output will appear in the **DataWeave Output Panel** at the bottom of your screen

##### 2️⃣ Automatic Preview (DataWeave: Enable Auto Preview)

1. Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on Mac)
2. Type **"DataWeave: Enable Auto Preview"** and press Enter
3. Every time you save your mapping file, the preview will automatically execute
4. ✅ Perfect for rapid experimentation and debugging!

#### Example Workflow

```
1. Edit src/main/dw/main.dwl
2. Save the file (Ctrl+S)
3. Auto Preview runs automatically
4. View output in DataWeave Output Panel
5. Iterate on your transformation
```

#### 📝 Tips for Best Results

- ✅ Ensure input files exist in `src/test/resources/main/Playground/inputs/` when previewing `main.dwl`
- ✅ Use descriptive variable names in `vars.dwl` for clarity
- ✅ Test edge cases by creating multiple input scenarios
- ✅ Use `error.dwl` to simulate error handling scenarios

#### 🔗 References

- 📘 [DataWeave Extension Documentation](https://docs.mulesoft.com/dataweave/latest/dataweave-extension)
- 📘 [DataWeave Extension Plugin Guide](https://docs.mulesoft.com/dataweave/latest/dataweave-extension-plugin)
- 📘 [DataWeave Testing Framework](https://docs.mulesoft.com/dataweave/latest/dataweave-testing-framework)
- 📘 [DataWeave Maven Plugin](https://docs.mulesoft.com/dataweave/latest/dataweave-maven-plugin)

</details>

<div align="right"><a href="#-table-of-contents">⬆️️️ Back to Top</a></div>

---

## 🎯 Usage Examples

### Example 1: Transform JSON Payload

```js,dw,dataweave
%dw 2.0
output application/json
---
payload.users map (user) -> {
    fullName: user.firstName ++ " " ++ user.lastName,
    email: lower(user.email)
}
```

### Example 2: Date Formatting with Module

```js,dw,dataweave
%dw 2.0
import dateTimeConversion from DateFormatConversionModule
output application/json
---
{
    timestamp: dateTimeConversion(now(), "yyyy-MM-dd'T'HH:mm:ss"),
    readable: dateTimeConversion(now(), "MMMM dd, yyyy")
}
```

### Example 3: Working with Mule Runtime Objects

```js,dw,dataweave
%dw 2.0
output application/json
---
{
    data: payload,
    requestId: correlationId,
    headers: attributes.headers,
    customVar: vars.myVariable,
    hello: Mule::p("example.hello")
}
```

<div align="right"><a href="#-table-of-contents">⬆️️️ Back to Top</a></div>

---

## 🏗️ Creating New Modules

### Step 1: Create the Module File

Create a new `.dwl` file in `src/main/dw/`:

```js,dw,dataweave
%dw 2.9
// src/main/dw/StringUtilsModule.dwl

/**
 * Capitalizes the first letter of each word.
 *
 * @param text - The input string
 * @return The title-cased string
 */
fun titleCase(text: String): String =
    text splitBy " "
    map (word) -> upper(word[0]) ++ lower(word[1 to -1])
    joinBy " "

/**
 * Removes all whitespace from a string.
 *
 * @param text - The input string
 * @return String without whitespace
 */
fun removeWhitespace(text: String): String =
    text replace /\s+/ with ""
```

### Step 2: Create a Test Mapping

Create a test file in `src/test/dw/` when the module needs automated coverage:

```js,dw,dataweave
%dw 2.0
// src/test/dw/StringUtilsMapping.dwl
import * from StringUtilsModule
output application/json
---
{
    titleCaseResult: titleCase("hello world"),
    noWhitespace: removeWhitespace("hello world")
}
```

### Step 3: Add Test Input (Optional)

Create input files in `src/test/resources/StringUtilsMapping/Playground/inputs/` if the script needs preview fixtures:

```json
// payload.json
{
    "text": "hello dataweave playground"
}
```

### Step 4: Run Your Test

```bash
mvn test -Dtest=StringUtilsMapping
```

<div align="right"><a href="#-table-of-contents">⬆️️️ Back to Top</a></div>

---

## 📚 Documentation Standards

Follow these conventions for well-documented modules:

### Function Documentation Template

```js,dw,dataweave
/**
 * Brief description of what the function does.
 *
 * === Parameters
 *
 * [%header, cols="1,1,3"]
 * |===
 * | Name | Type | Description
 * | paramName | ParamType | What this parameter is for
 * |===
 *
 * === Example
 *
 * [source,DataWeave,linenums]
 * ----
 * %dw 2.0
 * import myFunction from MyModule
 * output application/json
 * ---
 * myFunction("input")
 * ----
 *
 * ==== Output
 * [source,json]
 * ----
 * "expected output"
 * ----
 */
fun myFunction(param: Type): ReturnType = ...
```

### 📝 Naming Conventions

| Type          | Convention                    | Example                       |
| ------------- | ----------------------------- | ----------------------------- |
| Modules       | PascalCase + `Module` suffix  | `StringUtilsModule.dwl`       |
| Test Mappings | PascalCase + `Mapping` suffix | `StringUtilsMapping.dwl`      |
| Unit Tests    | PascalCase + `Test` suffix    | `StringUtilsModuleTest.dwl`   |
| Functions     | camelCase                     | `formatDate()`, `parseJson()` |

<div align="right"><a href="#-table-of-contents">⬆️️️️ Back to Top</a></div>

---

## 🌐 Publishing to Exchange

Share your modules with others by publishing to Anypoint Exchange!

### Prerequisites

1. **Anypoint Platform Account** with Exchange Contributor permissions
2. **Configure credentials** in `~/.m2/settings.xml`:

```xml
<server>
    <id>exchange</id>
    <username>your-username</username>
    <password>your-password</password>
</server>
```

### Enable Exchange Publishing

Replace the placeholder organization id in `pom.xml`, then uncomment the Exchange configuration:

```xml
<distributionManagement>
    <repository>
        <id>exchange</id>
        <name>Exchange Repository</name>
        <url>https://maven.anypoint.mulesoft.com/api/v3/organizations/${project.groupId}/maven</url>
        <layout>default</layout>
    </repository>
</distributionManagement>
```

### Publish

```bash
mvn deploy -Dproject.groupId=your-organization-id
```

<div align="right"><a href="#-table-of-contents">⬆️️️️️ Back to Top</a></div>

---

## 🤝 Contributing

1. 🍴 Fork the repository
2. 🌿 Create a feature branch (`git checkout -b feature/amazing-module`)
3. 💾 Commit your changes (`git commit -m 'Add amazing module'`)
4. 📤 Push to the branch (`git push origin feature/amazing-module`)
5. 🔃 Open a Pull Request

---

## 📄 License

This project is for development and learning purposes.

---

## 🔗 Resources

- 📘 [DataWeave Documentation](https://docs.mulesoft.com/dataweave/latest/)
- 🎮 [Online DataWeave Playground](https://dataweave.mulesoft.com/learn/playground)
- 📦 [Anypoint Exchange](https://mulesoft.com/exchange/)
- 🧪 [DataWeave Testing Framework](https://docs.mulesoft.com/dataweave/latest/dataweave-testing-framework)

---

<p align="center">
  Made with ❤️ for the MuleSoft Community
</p>
