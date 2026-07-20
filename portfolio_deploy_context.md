# Portfolio Deployment - Done (17 Jul 2026)

This file was a handoff for deploying the portfolio. That work is complete, so it is
kept only as a short record. **The live source of truth is the portfolio repo's
`AGENTS.md`** at `/home/devniru2704/Personal Files/Programs/Github/portfolio-3.0/AGENTS.md`.

## Outcome

The portfolio (`portfolio-3.0`) is live at https://devniru.in - the website listed on
the SAP resume in this project. Vercel hosting on `main`, PostgreSQL on Supabase
(ap-south-1), Resend email on the `send.devniru.in` subdomain, DNS at GoDaddy.

## What was done

- Replaced all fabricated demo content (fake projects, testimonials, GitHub stats,
  telemetry, placeholder identity) with real, verifiable content.
- Moved projects, blog posts, labs, philosophy principles, and the `/now` sections
  into Postgres; identity, experience, and skills stay in static config.
- Wrote five original blog posts from Nirmalya's own project guideline docs.
- Locked down the database: RLS enabled with no policies on every table, plus
  revoked `anon`/`authenticated` grants, because Supabase publishes the public
  schema over PostgREST and the `Message` table holds contact-form PII.
- Added `public/resume.pdf` (copy of `Nirmalya_Mandal_Resume_16072026.pdf`), an OG
  image, and a favicon; wrote `AGENTS.md`, `CLAUDE.md`, and `README.md`.

## Cross-project note

`public/resume.pdf` in the portfolio repo is a copy of the resume in this project.
**If the resume changes here, copy it across again** - nothing syncs it automatically.

## Known follow-ups

- The apex `devniru.in` redirects to `www.devniru.in`, but `owner.url` (and therefore
  the sitemap, `og:url`, and canonical tags) advertises the apex. Everything resolves,
  but the two should be made to agree eventually. Details in the repo's `AGENTS.md`.
- Content editing still means updating `prisma/seed.ts` and re-seeding. An
  authenticated CMS is the next planned piece of work; see the "CMS status" section
  of the repo's `AGENTS.md` for current state and prerequisites.
