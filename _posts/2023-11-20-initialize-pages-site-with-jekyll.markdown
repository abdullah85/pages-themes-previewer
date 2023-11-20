---
layout: post
title:  "Initialize GithubPages Site with Jekyll"
date:   2023-11-20 11:35:41 +0530
categories: github pages jekyll
---

## Overview
{:.no_toc}
Let's review the steps to initialize [github pages site][pages-themes-previewer] with jekyll[^gh-pages-jekyll].

* Placeholder for Table Of Contents
{:toc}

## Initialize Repository with Publishing Source

+ First, I created the repository `pages-themes-previewer` on Github
  + I made the repository public to reduce hassles in subsequent steps.
+ Next, I cloned the repository to local system
+ Now, I chose `gh-pages` branch option for [publishing][config-publishing-source]
    On Local repository

```
    $ git checkout --orphan gh-pages
    # Creates a new branch, with no history or contents, called gh-pages, and switches to the gh-pages branch
    $ git rm -rf .
    # Removes the contents from your default branch from the working directory
```

## Create Jekyll Site and Test

+ I then created a new jekyll site (in local repository from root),

```
    jekyll new --skip-bundle .
    # Creates a Jekyll site in the current directory
```

+ I modified the created Gemfile (see [here][gh-pages-jekyll] steps 8-12)

```
    # gem "jekyll", "~> 4.3.2"
    # This is the default theme for new Jekyll sites. You may change this to anything you like.
    gem "minima", "~> 2.5"
    # If you want to use GitHub Pages, remove the "gem "jekyll"" above and
    # uncomment the line below. To upgrade, run `bundle update github-pages`.
    gem "github-pages", "~> 228", group: :jekyll_plugins
```

and executed `bundle install`

+ While [testing site locally][test-site-locally] (step 14 of [reference][gh-pages-jekyll]), I got the following error

```
    jekyll-3.9.3/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
```

resolved by `bundle add webrick` and tested successfully with `bundle exec jekyll serve` !!!

## Push Changes to Origin Repository

+ Commit changes locally

```
	git add .
	git commit -m 'Initial GitHub pages site with Jekyll'
```

+ Can skip Step 16 of [reference][gh-pages-jekyll] as I had cloned from remote repository

```
	$ git remote -v
	origin	git@github.com:abdullah85/pages-themes-previewer.git (fetch)
	origin	git@github.com:abdullah85/pages-themes-previewer.git (push)
```
 
+ Finally, completed Step 17 by pushing to origin

```
	$ git push -u origin gh-pages 
	Enumerating objects: 12, done.
	Counting objects: 100% (12/12), done.
	Delta compression using up to 4 threads
	Compressing objects: 100% (12/12), done.
	Writing objects: 100% (12/12), 6.27 KiB | 6.27 MiB/s, done.
	Total 12 (delta 0), reused 1 (delta 0), pack-reused 0
	remote: 
	remote: Create a pull request for 'gh-pages' on GitHub by visiting:
	remote:      https://github.com/abdullah85/pages-themes-previewer/pull/new/gh-pages
	remote: 
	To github.com:abdullah85/pages-themes-previewer.git
	* [new branch]      gh-pages -> gh-pages
   Branch 'gh-pages' set up to track remote branch 'gh-pages' from 'origin'.
```

## Publish Site and View Changes

Now, that our repository is updated with required jekyll site at `gh-pages` branch,
we  may need to complete the remaining steps (from 18 to 23) manually online 
with Github Web Interface. In my case, for the configurations I had set,
I found that the site was automatically deployed the moment I pushed to the remote repository.
That is, when I logged into github after pushing `gh-pages`, I got a message that my website was 
release at the URL -
[https://abdullah85.github.io/pages-themes-previewer/](https://abdullah85.github.io/pages-themes-previewer/)

![img](/pages-themes-previewer/assets/images/2023-11-19/2023-11-18-5by3-AspectRatio-error.png)

Though the site is live, there seems to be some issue with the styling or presentation.

## Resolve Styling Issue

The above styling issue did not occur while testing locally earlier and appears
only on deployment to Github Pages.  On reviewing the Developer Console `F12`,
I found that `main.css`, `minima-social-icons.svg` was not found. 
I resolved this by setting the `baseurl` value within `_config.yml` to 
`pages-themes-previewer` which is the subpath on 
Github Pages (mentioned in step 13 of [reference][gh-pages-jekyll])
and the issue was resolved on pushing the changes.

## Conclusion
{:.no_toc}

Thus, [`pages-themes-previewer`][repo-ghpages-previewer] was initialized as a  [Github Pages site with jekyll][gh-pages-jekyll].


-----------------------------

[^gh-pages-jekyll]: See [github Pages initialization process][gh-pages-jekyll]

[pages-themes-previewer]: https://github.com/abdullah85/pages-themes-previewer
[repo-main-pages-themes-previewer]: https://abdullah85.github.io/pages-themes-previewer/
[repo-ghpages-previewer]: https://github.com/abdullah85/pages-themes-previewer/tree/gh-pages

[gh-pages-jekyll]: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site
[config-publishing-source]: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
[test-site-locally]: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll

[screenshot-on-github]: https://github.com/toolsforproductivity/pages-theme-selector/assets/116780660/de1ae52d-01b1-4030-b882-75fc6d0200e1
