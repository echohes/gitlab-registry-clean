#!/usr/bin/env bash
set -o errexit
set -o nounset

token=$1
url=$2
day_count_save=$3

#get all project from gitlab, limit 100
all_project=`curl -s --header "Private-Token: ${token}" https://${url}/api/v4/projects?per_page=100`

#parse all project in gitlab with JQ
echo $all_project | jq ' .[] | .id' | while read project_id
do
    echo "PROJECT ID" ${project_id}
    #get registry id by project
    registry_id_json=`curl -s --header "Private-Token: ${token}" https://${url}/api/v4/projects/${project_id}/registry/repositories`
        if [ ${#registry_id_json} -gt 2 ]; then
            #parse all reg id from project
            echo $registry_id_json | jq ' .[] | .id' | while read registry_id
            do
            #curl --request DELETE --data 'name_regex=.*' --data 
                echo "REGISTRY" $registry_id "START CLEAR"
                curl -s --request DELETE --data "name_regex=.*" --data "keep_n=$day_count_save" --header "Private-Token: ${token}" "https://${url}/api/v4/projects/${project_id}/registry/repositories/$registry_id/tags"
            done
        else
            echo "REGISTRY NOT FONUD"
        fi
done