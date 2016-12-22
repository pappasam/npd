
# default value for the config_file variable
config_file=$HOME/course_vars.cfg

while getopts "f:" flag
do
    if [ "$flag" = "f" ]; then
        echo "using config file: $OPTARG"
        config_file=$OPTARG
    fi
done

if [ -f $config_file ]; then
    echo "Overwriting course environment variables at $config_file (press Ctrl+C to cancel)"
fi

echo -e "Enter your github username: \c "
read  gh_user
echo -e "Enter the name of the github repository your created in class, suggested name was \"intro-programming\": \c "
read  gh_project
echo -e "Enter the public name you would like git to associate with your commits: \c "
read  gh_name
echo -e "Enter the email you used when you signed up for github: \c "
read  gh_email


echo "export gh_user=\"$gh_user\"" > $config_file
echo "export gh_project=\"$gh_project\"" >> $config_file
echo "export gh_name=\"$gh_name\"" >> $config_file
echo "export gh_email=\"$gh_email\"" >> $config_file
echo "export gh_repo=\"https://github.com/$gh_user/$gh_project.git\"" >> $config_file

echo "export config_file=\"$config_file\"" >> $config_file
