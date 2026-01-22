# Professional Resume

A clean, ATS-friendly LaTeX resume template showcasing professional experience, projects, technical skills, achievements, and education.

## 📄 Overview

This repository contains my professional resume built with LaTeX, optimized for Applicant Tracking Systems (ATS) while maintaining a modern, visually appealing design.

## 🎯 Features

- **ATS-Friendly**: Clean structure and formatting for optimal parsing by recruitment systems
- **Single-Page Layout**: Concise, impactful presentation fitting on one page
- **Professional Design**: Modern typography with colored hyperlinks and professional photo
- **Comprehensive Sections**:
  - Professional Summary
  - Work Experience
  - Projects
  - Technical Skills (categorized)
  - Achievements
  - Education

## 🛠️ Technical Stack

- **LaTeX Compiler**: pdfLaTeX
- **Document Class**: article
- **Key Packages**:
  - `geometry` - Custom margins and page layout
  - `hyperref` - Clickable links with custom colors
  - `fontawesome5` - Professional icons
  - `enumitem` - Custom list formatting
  - `titlesec` - Section formatting
  - `xcolor` - Link colors

## 📋 Structure

```
resume.tex          # Main LaTeX source file
resume.pdf          # Compiled PDF output
nirupam.jpg         # Profile photo
README.md           # This file
```

## 🚀 Compilation

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Required packages (usually included in full LaTeX installations)

### Build Instructions

```bash
# Compile the resume
pdflatex resume.tex

# Clean auxiliary files (optional)
rm -f *.aux *.log *.out
```

## 📝 Customization

The resume uses custom commands for easy maintenance:

- `\resumeItem{description}` - Individual bullet points
- `\resumeSubheading{Title}{Date}{Company}{Location}` - Experience/education entries
- `\resumeProjectHeading{Project}{Link}` - Project headers

### Color Scheme
- Links: Custom blue (`RGB: 0,102,204`)
- Sections: Professional styling with custom spacing

## 📄 License

This resume template is personal and proprietary. Feel free to use the structure as inspiration for your own resume.
