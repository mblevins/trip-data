# trip-data
Data and trips for photo and blog processing, used as a common repo across projects
(it should be a submodule, but I can never remember submodule commands)

The general workflow is that the json files are created and updated in the icloud/darktable workflow and consumed in the smug-cli workflow, but somtimes the files are updated out of order. 

## iCloud Photos and Darktable

This is done on machines with an icloud account associated with the photos, so there it is more of a manual workflow with this repo as a helper.

There are two people, Lola and Mike. Mike has a removable disk on his machine,because he's low on disk space, and that's also used to move files bwteen machines.

It requires [osxphotos](https://github.com/RhetTbull/osxphotos) to be installed on both machines.

Assume a directory stucture like this:

- $Work_Dir (on a removable disk)
    - Darktable
        - trip-data (this repo)
        - import
        - export

Workflow:

Mike's machine:

- Fill out a new json file in the format of “trips*.json” in trip-data

- Run create-photos-export.sh with the name of the json file

```
cd $Work_Dir/Darktable/import
bash ../trip-data/create-photos-export.sh M ../trip-data/<json-file>
```

Lola's machine:

Attach the removable disk

- Run create-photos-export.sh with the name of the json file

```
cd $Work_Dir/Darktable/import
bash ../trip-data/create-photos-export.sh M ../trip-data/<json-file>
```

Back to Mike's Machine:

Reattach the disk (at this point they've worked, so no more changes expected for this session)

Check in the trips files
```
cd trip-data
git add *.json
git commit
git push
```

Now,

- Import the imports into dark table 

- Export from dark table into the exports directory

- Upload to smug mug

## Smugmug and eleventy processing

See [smug-cli](https://github.com/mblevins/smug-cli), trip-data is used there as well
