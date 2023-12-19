<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="./app/assets/images/logo.svg" alt="RubyTunes Logo"></a>
</p>

<h3 align="center">RubyTunes</h3>

---

This is the repository of RubyTunes, a music streaming platform that lets you
upload your favorite freestyles and stream those of others.

<img width="1223" alt="Skärmavbild 2023-12-19 kl  8 46 53 PM" src="https://github.com/tzuntar/rubytunes/assets/35228139/c9981f97-a49c-40db-ad01-f908d4028bc7">

Made as a high school project back in 2022-23. The main premise of the app is that
users can upload their own songs, the same way it works on Soundcloud.

<p><sub>Note that the screenshot is purely informative and I (obviously) don't claim any rights
to ATLiens. Go to Outkast's Spotify profile for that one ;)</sub></p>

## 💎 Features

- Music streaming with real-time graphical equalizer.
- Upload your own songs and collabs with others (users or not).
- Automatic MP3 metadata and album art linking directly from the files itself.
- Browse user profiles and save your favorite songs to yours.
- High quality search (not the plain string matching-based one).
- Comments with linked timestamps.

## 📝 Table of Contents

- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the RubyTunes up and running on your local machine for development and testing
purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### ✅ Prerequisites <a name = "prerequisites"></a>

- Ruby on Rails
- A working PostgreSQL instance

### ⏳Installing

1. Install Ruby on Rails and PostgreSQL
2. Set up the database by running `rails db:setup`
3. Run the Rails server:
   - for development: `bin/dev`
   - for production: `rails s`

## 🚀 Deployment <a name = "deployment"></a>

Check the configuration files in the `app/config` directory, (optionally) set up ActiveStorage on a cloud provider.

## ✍️ Authors <a name = "authors"></a>

- [@tzuntar](https://github.com/tzuntar) - Development

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

This project was inspired by SoundCloud and Spotify.
