# DriveNova Motors Website

A responsive multi-page static website for a car dealership / automotive brand.

## Included pages
- `index.html` - home page
- `about-us.html` - company story and values
- `articles.html` - article listing page
- `article.html` - featured article page
- `contact-us.html` - contact and enquiry form
- `sitemap.html` - HTML sitemap

## Front-end assets
- `css/styles.css` - all styling
- `js/main.js` - mobile menu + contact form interaction
- `images/*.svg` - lightweight vector graphics

## Run locally
Open `index.html` directly in a browser, or serve the folder with any static file server.

## Kubernetes deployment
This repository includes example manifests for deploying the static site on Kubernetes behind an AWS ALB ingress.

## Notes
- Replace placeholder email, phone number, and address with your own details.
- Update the container registry values in the manifests before deployment.
