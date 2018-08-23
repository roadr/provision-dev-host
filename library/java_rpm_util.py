#!/usr/bin/python

from ansible.module_utils.basic import *
import requests
import re

main_page_url = "http://www.oracle.com/technetwork/java/javase/downloads/index.html"
first_part = "http://www.oracle.com"
jdk_page_pattern = "/technetwork/java/javase/downloads/jdk' + item+ '-downloads-[\\d]+.html'"

def jdk_page_pattern_for_version(version):
    return "/technetwork/java/javase/downloads/jdk" + version + "-downloads-[\d]+.html"

def jdk_rpm_pattern_for_version(version):
    #/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm"
    #/otn-pub/java/jdk/" + version + "u[\d]+-b[\d]+/[\w]+/jdk-"+version+"u[\d]+-linux-x64.rpm"
    #/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.rpm
    pattern = "(http://download\.oracle\.com/otn-pub/java/jdk/" + version + ".+/\w+/jdk-"+version+".+linux-x64(_bin\.|\.)rpm)"
    #print(pattern)
    return pattern

def jdk_complete_version(version, rpm_url):
    if version == "8":
        complete_version = re.findall("8u(\d+)", rpm_url)[0]
        return "jdk1.8.0_%s-amd64" % complete_version
    elif version == "9":
        complete_version = re.findall("jdk-(9\.[0-9.]+)", rpm_url)[0]
        return "jdk-%s" % complete_version
    elif version == "10":
        complete_version = re.findall("jdk-(10\.[0-9.]+)", rpm_url)[0]
        return "jdk-%s" % complete_version
        #return "jdk-10"
    else:
        raise "don't know how to parse complete version for major version %s" % version

def main():
    fields = {
            "java_versions": {"required": True, "type": "list"}
            }
    module = AnsibleModule(argument_spec=fields)
    java_versions = module.params["java_versions"]

    main_page_content = str(requests.get(main_page_url).content)

    jdk_page_urls = {}

    for java_v in java_versions:
        #print(main_page_content)
        #print(jdk_page_pattern_for_version(java_v))
        match = re.findall(jdk_page_pattern_for_version(java_v), main_page_content)
        jdk_page_urls[java_v]=match[0]

    jdk_rpm_url = []
    for k,v in jdk_page_urls.items():
        jdk_page = requests.get(first_part + v).content
        rpm_url = re.findall(jdk_rpm_pattern_for_version(k), jdk_page)[0][0]
        jdk_rpm_url.append({
            "major_version": k, 
            "complete_version": jdk_complete_version(k, rpm_url), 
            "rpm_url": rpm_url
            })

    module.exit_json(changed=False, meta=jdk_rpm_url)


if __name__ == '__main__':
    main()
