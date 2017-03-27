#!/bin/bash
set -e
set -o pipefail

REPO_URL="${REPO_URL:-smtudor}"

build_image(){
    base=$1
    suite=$2
    build_dir=$3

    echo "Building ${REPO_URL}/${base}:${suite} for context ${build_dir}"
    docker build --rm --force-rm --no-cache -t ${REPO_URL}/${base}:${suite} ${build_dir} || return 1

    # on successful build, push the image
    echo "                       ---                                   "
    echo "Successfully built ${base}:${suite} with context ${build_dir}"
    echo "                       ---                                   "
}

main(){
    # get the dockerfiles
    IFS=$'\n'
    files=( $(find . -iname '*Dockerfile' | sed 's|./||' | sort) )
    unset IFS

    ERRORS=()
    # build all dockerfiles
    for f in "${files[@]}"; do
        image=${f#*\/}
        base=${image%%\/*}
        build_dir=$(dirname $f)
        suite=${build_dir##*\/}

        if [[ -z "$suite" ]] || [[ "$suite" == "$base" ]]; then
            suite=latest
        fi

        if [[ "${base}" == "sup" ]]; then
            continue
        fi

        {
            build_image "${base}" "${suite}" "${build_dir}"
        } || {
            # add to errors
            ERRORS+=("${base}:${suite}")
        }
    echo
    echo
done

if [ ${#ERRORS[@]} -eq 0 ]; then
    echo "No errors, hooray!"
else
    echo "[ERROR] Some images did not build correctly, see below." >&2
    echo "These images failed: ${ERRORS[@]}" >&2
    exit 1
fi
}

main $@
