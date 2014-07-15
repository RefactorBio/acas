# ACAS Project
  
Scroll down for previous deploy instructions

## Deploying to a customer

See 
```
#!bash

bin/install.sh
```


## Deploying in a development environment

### If in existing directory - Remove old links

    if [ -h "acas" ]; then
	    rm acas
    fi
    if [ -h "blueimp" ]; then
	    rm blueimp
    fi
    if [ ! -d "log" ]; then
	    mkdir log
    fi

### Create a super-acas folder 
Often node_apps at customer locations

    mkdir super-acas
    cd super-acas

### Create a folder for this deploy 
Others deploys can be created next to this one. The name may be acas-host3 or acas-local

    date=$(date +%Y-%m-%d-%H-%M-%S)
    mkdir acas-$date
    ln -s acas-$date acas
    cd acas-$date

    git clone git@bitbucket.org:mcneilco/acas.git .

or

    git clone https://$USER@bitbucket.org/mcneilco/acas.git .
    
    ln -s serverOnlyModules/blueimp-file-upload-node/ ../blueimp

### Get custom folder

    git clone git@bitbucket.org:mcneilco/acas_custom_host3 acas_custom
    
or

    svn checkout http://smeyer@customer_repo/............. acas_custom

### Install dependencies

    npm install
    grunt coffee
    grunt copy
    cd conf
    node PrepareConfigFiles.js 
    node PrepareModuleIncludes.js
    Rscript install.R master mcneilco

And... if it exists

    Rscript config.R smeyer

Set environment variables (do in .bash_profile later)

    export ACAS_HOME=$(pwd)/..
    export R_LIBS=$ACAS_HOME/r_libs
    cd ..
   
### Test

    R -e "library(racas);query('select * from api_protocol')"

Point browser at these
    
    http://host3.labsynch.com:3000/specRunner
    http://host3.labsynch.com:3000/liveServiceSpecRunner

### Start

    node app.js
    node serverOnlyModules/blueimp-file-upload-node/server.js
 
## Deploying a customer branch (to be deprecated)

### Stopping a previous deploy

    cd $ACAS_HOME
    forever stopall
    ps -ef | grep node
    kill -9 othernodeprocess
    cd ..
    rm acas

### Downloading ACAS
Usually done in /opt/node_apps

    curl --digest --user gitusername:gitpassword https://bitbucket.org/mcneilco/acas/get/host3.labsynch.com.tar.gz | tar xvz
    ln -s mcneilco-acas-f46a5c67fbd4 acas
    cd acas
    npm install
    cd conf
    node PrepareConfigFiles.js

Then start with
    
    /etc/init.d node_apps start
    
or

    forever start app.js
    forever start serverOnlyModules/blueimp-file-upload-node/server.js

*Note, do not rename mcneilco-acas-f46a5c67fbd4 because this tell us which checkout of acas is running.  The specific commit number that we track
is the first 7 digits of the trailing hash.  So in the above example, host3.labsynch.com is on commit "f46a5c6".
These commits are tracked here:
   http://localhost:1080/mcneilco/TreeView.php?thing_id_395
    
Configuration file is in acas/public/src/conf/configurationNode.js

Depending on the port and host in the configuration file, you should be able to now go to something like:

    http://host3.labsynch.com:3000/#
### Running Tests
Run Tests against stubbed services by pointing your browser at:

    http://host3.labsynch.com:3000/specRunner

Run Tests against live services by pointing your browser at:

    http://host3.labsynch.com:3000/liveServiceSpecRunner

If everything is configured correctly, then all tests should pass

## Creating a customer branch
 
Each customer should have a branch and this is how you create the branch
 
    git clone https://bbolt@bitbucket.org/mcneilco/acas.git
    git checkout -b host3.labsynch.com
    git push origin host3.labsynch.com
 

## Pulling down changes from Master to Branch

This is for when you want to merge all the changes that have been made in the master branch down to your customer branch.

The overall idea is that you are taking all your current branch commits and placing them on top of a new master checkout.  This is what git calls "rebasing"

There is a way to undo this so don't worry so much (see undoing rebase below)!

**Workflow:**

...starting in your branch...

...you notice master has been updated and want those changes...

...first commit all your changes to host3.labsynch.com...

...then go to the master branch...

    git checkout master

... pull down the latest changes...

    git pull

...switch back to your branch and rebase your commits on top of this master...

    git checkout host3.labsynch.com
    git rebase master
    
... if anything goes wrong, read the two sections below, otherwise...

... you can then push your changes back up to the origin branch with your new master base...

    git push origin host3.labsynch.com

## Returning to state before a bad rebase

We use 'git reflog' for this.  This lets you examine the history of your branch to find out where you were right before the rebase.


Starting from the top of the list, you look for the first instance of 'moving from master to host3.labsynch.com'

    git reflog

    f46c634 HEAD@{9}: checkout: moving from master to host3.labsynch.com HEAD@{12}: pull origin host3.labsynch.com: Fast-forward

to reset

    git reset f46c634 --hard

You should not be back where you started

## If there are conflicts during the rebase you resolve

Example:

    [bbolt@host3 acas]$ git rebase master
    First, rewinding head to replay your work on top of it...
    Applying: testing small change
    Applying: README.md edited online with Bitbucket    
    Using index info to reconstruct a base tree...    
    M	README.md   
    Falling back to patching base and 3-way merge...    
    Auto-merging README.md    
    CONFLICT (content): Merge conflict in README.md    
    Failed to merge in the changes.    
    Patch failed at 0002 README.md edited online with Bitbucket        
    When you have resolved this problem run "git rebase --continue".    
    If you would prefer to skip this patch, instead run "git rebase --skip".   
    To check out the original branch and stop rebasing run "git rebase --abort".

Git Status should reveal something like this:

        [bbolt@host3 acas]$ git status
    # Not currently on any branch.
    # Unmerged paths:
    #   (use "git reset HEAD <file>..." to unstage)
    #   (use "git add/rm <file>..." as appropriate to mark resolution)
    #
    #	both modified:      README.md
    #
    no changes added to commit (use "git add" and/or "git commit -a")

To accept theirs:

    git checkout --theirs README.md 

To accept yours:

    git checkout --ours README.md 

Or if you have a merge tools installed:

    git mergetool

If not, you can edit the file with a text editor.

Finally, add the change and continue the rebase

    git add README.md 
    git rebase --continue

       Applying: README.md edited online with Bitbucket

## Merging a branch to master

 1. To start make sure you are fully commited and pushed in your branch
 2. Your master checkout is fully up to date (git pull origin master)
 
...starting on master...

    git checkout master
  
...merge your branch in dry run....

    git merge --no-commit --no-ff host3.labsynch.com
    Auto-merging README.md
    Automatic merge went well; stopped before committing as requested

...if that goes well...
   
    git merge --no-commit host3.labsynch.com
    fatal: You have not concluded your merge (MERGE_HEAD exists).
    Please, commit your changes before you can merge.
    
...you don't want to commit your configuration files, so...

    git reset HEAD public/src/conf/configuration.js
    git reset HEAD public/src/conf/configurationNode.js
    git checkout -- public/src/conf/configurationNode.js 
    git checkout -- public/src/conf/configuration.js

...review the changes before committing...

    git status

...finally...

    git commit -m "merged with host3.labsynch.com"
    git push origin master


## Information for editing this markdown file
 
  - [Bitbucket  Markdown Tutorial][1]
  - [Markdown editor (for previewing changes)][2]
 
 
[1]:https://confluence.atlassian.com/display/BITBUCKET/Displaying+README+Text+on+the+Overview#DisplayingREADMETextontheOverview-ExampleMarkdownREADME
[2]: http://hashify.me/


## Creating and Applying a patch file

### Prerequesites

You need to know these things before creating a patch file: 

1. The commit you are patching (e.g. 505101c, this should be a tag in the repository (e.g. 1.1.0))
2. The commit you are applying (e.g. 343974b, this should also be a tagged release in the repository (e.g. 1.1.1))

###Creating a patch file: Single Commit

1. From source tree > Right click the commit you are patching (e.g. 1.1.0)
2. Choose "Create Patch"
3. Choose "Patch From Commits" (tab on top)
4. Scroll up to the commit you are applying and select it (e.g. 1.1.1)
5. Name the patch file (e.g. 1.1.0-1.1.1-patch.diff)

###Creating a patch file: Multiple Commits

1. In Terminal, go to ACAS_HOME

```
#!sh

git diff 505101c..343974b > 1.1.0-1.1.1-patch.diff

```


###Applying a patch file

1. Upload the patch.diff file to ACAS_HOME on the instance you are patching
2. Apply the patch in dry-run mode


```
#!sh

    patch --dry-run -p1 < 1.1.0-1.1.1-patch.diff

```
    

3. It will print the changes it plans to make, if this looks ok then proceed
4. Apply the patch


```
#!sh

    patch -p1 < 1.1.0-1.1.1-patch.diff

```


###Reverting a patch file


```
#!sh

    patch -p1 -R < 1.1.0-1.1.1-patch.diff
```
