# gitlab-registry-clean
Easy bash script to clean all project from gitlab-registry


# Dependencies
    # Debian:
        apt install jq curl
    # Centos:
        yum install jq curl


# Run script:
    gitlab-registry-clean.sh ${TOKEN} ${URL PROJECT} ${Save the last N records}

# Example:
# Clear registry  in  gitlab.example.com and saved last 10 records:
    gitlab-registry-clean.sh sdflkj1l-Vd-VklkdaFf gitlab.example.com 10



# You can get a token according to the instructions in the official documentation:
# https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html 