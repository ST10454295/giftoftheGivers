# Gift of the Givers website user guide

## Before you begin

Use the site only after the project administrator has configured its SQL database and provisioned your account. The assignment prototype stores donation records but does not take payments. The volunteer form stores an expression of interest. The site does not send confirmation emails.

## Open the website

1. Open the link supplied by the team or run the local website from Visual Studio.
2. Select **Home** to see the public landing page.
3. Use **About** and **Contact** for project information. Contact details must be verified and added by the team before any public release.

_Add a screenshot of the home page here: `evidence/01-home.png`._

## Sign in as a donor or employee

1. Select **Sign in** in the top navigation.
2. Enter the email address and password for an account already provisioned by the administrator.
3. Select **Sign in**.
4. Donors return to the public site. Employees with the `Employee` role can open the employee dashboard.
5. Select **Sign out** in the top navigation to end the session.

Anonymous donations do not require an account. The administrator must provision donor and employee accounts before these login steps can succeed. The included `AccountProvisioner` prompts for the account data and a hidden password; for employee accounts it can also add a starter relief project. The database connection should be set only for the current terminal session. Do not send passwords by email or place them in source control.

_Add screenshots of the sign-in page and the dashboard after a successful employee login here._

## Record a donation

1. Select **Donate**.
2. Select **Once-Off** or **Recurring**.
3. Enter a positive amount and choose ZAR, USD, or EUR.
4. Select **Donate anonymously** to proceed without a donor account. Clear it only when signed in to a donor account.
5. Select **Donate Now**.
6. Keep the reference shown on the confirmation page. Select **Download demonstration acknowledgement** to save a text acknowledgement.

The recurring choice is currently stored as a frequency label only. It does not schedule future payments. The acknowledgement is not an official tax certificate or proof of payment. The website has no payment gateway. The team must implement and verify those integrations with the organisation before accepting real donations.

_Add screenshots of the completed donation form and confirmation page here._

## Post a project update as an employee

1. Ask the administrator to provision an employee account and an existing relief project.
2. Sign in using that account.
3. Open the **Employee Dashboard**.
4. In **Post Project Update**, select the relief project, enter a short title and update, then select **Post Update**.
5. Confirm the update appears in **Recent Project Updates**.

The employee dashboard needs at least one project row in the database before an update can be posted. If the list is empty, contact the project administrator; there is no project creation screen in this prototype.

_Add screenshots showing the project dropdown, submitted update, and update in the recent updates list._

## Volunteer registration

1. Select **Volunteer**.
2. Enter your first name, last name, email address, and phone number.
3. Add skills and choose your availability.
4. Select **Submit Interest**.
5. A confirmation page appears after the record is saved.

The site does not currently email the volunteer or notify staff. The organisation must review the saved record in its database/admin process.

_Add screenshots of the volunteer form and confirmation page._

## Generate a tax certificate

The current website cannot generate an official tax certificate. Its downloadable acknowledgement is explicitly marked as a demonstration. The Azure Function separately returns demonstration JSON data and is not connected to a verified donation/payment record. Do not provide either artifact as an official tax certificate. Before production, the organisation must approve the legal contents, donor identity checks, certificate numbering, storage, and authorized issuing process.

## Help and accessibility

Use a current desktop or mobile browser and zoom controls if text is small. If a form shows validation text, correct the indicated field and resubmit. For an account, database, or missing project issue, contact the team administrator.


