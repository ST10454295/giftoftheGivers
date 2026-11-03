# Gift of the Givers Final POE package

This package contains the cleaned ASP.NET Core MVC application, Azure Function project, test scaffolding, CI/CD workflow, a sample load test, an additive SQL script with rollback, and the user/team handover documents.

## What is implemented

- Repaired public navigation and routed donation and volunteer forms to their controllers.
- Replaced the login placeholder with a cookie sign-in form that validates stored password hashes and role claims. Accounts must already exist in SQL with ASP.NET Identity compatible password hashes.
- Corrected donor-to-user and employee-to-user ID mapping, volunteer field binding, and project-update field binding.
- Added xUnit validation and MVC integration tests, Selenium browser tests, and a k6 20 virtual-user load profile.
- Added a GitHub Actions workflow to build and run tests on pushes and pull requests, and to deploy to Azure when deployment secrets and variables are configured.
- Added reversible SQL reporting indexes.

## Known limits and required environment

- A complete local build/test could not run in this environment: NuGet package restore was blocked because outbound access to `api.nuget.org:443` is denied. Run restore/build/test on your computer or GitHub Actions.
- The project targets .NET 9 and requires the .NET 9 SDK, Visual Studio 2022 with ASP.NET workload, SQL Server/LocalDB, Node.js plus k6 for load testing, and Chrome for Selenium.
- The application needs a real SQL database and provisioned donor/employee accounts. Do not use a publicly exposed LocalDB connection string. Configure the `ConnectionStrings__DefaultConnection` App Service setting to your Azure SQL connection string and enable secure networking/firewall access.
- The tax-certificate function currently generates a demonstration JSON certificate response; it does not issue an official tax certificate, write certificate records, process payments, or integrate with a payment provider. Do not describe it to donors as an official receipt.
- No Azure resources were deployed from this environment. Azure deployment requires the team's app/function names, publishing profiles, Azure SQL connection, GitHub secrets, and a successful pipeline run.
- The assignment asks for screenshots and team contribution evidence. The submitted documentation contains capture checklists and an honest contribution form; add real screenshots and member details from your team before final submission.

## Local run

1. Open `Giftofthe_Givers.sln` in Visual Studio 2022.
2. Install the .NET 9 SDK and restore NuGet packages.
3. In Visual Studio, set `Giftofthe_Givers` as the startup project. Update its connection string via User Secrets or environment variable `ConnectionStrings__DefaultConnection`.
4. Apply the team's existing database schema/migrations. Run the included `AccountProvisioner` utility to create donor and employee accounts with securely hashed passwords.
5. Run the web project. Browse `/`, `/Donation`, `/Volunteer`, and `/Account/Login`.
6. Run tests with `dotnet test Giftofthe_Givers.Tests/Giftofthe_Givers.Tests.csproj`. Selenium browser tests expect the app to be running at `APP_BASE_URL` (default `https://localhost:7167`).
7. Run the k6 profile with `k6 run -e BASE_URL=https://localhost:7167 -e VUS=20 -e DURATION=1m load-test/home-load.js`.

Provision accounts locally with `$env:ConnectionStrings__DefaultConnection` set to your database connection, then run `dotnet run --project AccountProvisioner`. It prompts for role, name, email, and a hidden password; for an employee, it can also create a starter relief project.

The Azure Function uses the isolated worker runtime. For local development, install and run Azurite because `local.settings.json` uses the development storage emulator. Start the function with `func start` from `GiftOfTheGivers.Functions1`; POST JSON to `/api/generate-certificate` with `DonorName`, `Amount`, `DonationReference`, and `DonationDate`.



