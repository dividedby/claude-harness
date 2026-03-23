Create ROUTE_REFERENCE.md by scanning all routing, navigation, and entrypoint files.
Include for each route:
- Path and HTTP method
- Component/handler
- Auth requirements
- Important side effects

Then create SYSTEM_DOC.md with sections:
- Features & Routes by domain
- Known Issues (with last confirmed date)
- Data Cleanup / Cron / Background Jobs
- Security & Reliability Audits (with last audited date)
- Recent Changes Log (timestamped entries)

From now on, when features change:
- Update ROUTE_REFERENCE.md to match the code.
- Update SYSTEM_DOC.md with known issues, last audited, and a recent change entry.
