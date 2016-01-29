package main

import (
	"fmt"
	"log"
	"net"
	"os/exec"
	"strings"
)

func CheckInstall() {

	_checkPath := func(cmdName string) string {
		final, err := exec.LookPath(cmdName)
		if err != nil {
			return "Not Install " + cmdName
		}
		return final
	}

	var out []byte
	var err error
	results := []string{}
	cmdNames := []string{"php", "mysql", "redis-server", "go", "node", "npm", "yum", "wget", "screen", "make", "tar", "free", "man"}
	for index, ele := range cmdNames {
		results = append(results, ele+strings.Repeat(" ", 20-len(ele))+"| "+_checkPath(cmdNames[index]))
	}

	if out, err = exec.Command("hostname").Output(); err == nil {
		results = append(results, "\n系统信息\nhostname"+strings.Repeat(" ", 20-len("hostname"))+": "+string(out[0:len(out)-1]))
	}

	out, _ = exec.Command("date").Output()
	results = append(results, "localDate"+strings.Repeat(" ", 20-len("localDate"))+": "+string(out[0:len(out)-1]))

	results = append(results, "localIP"+strings.Repeat(" ", 20-len("localIP"))+": "+getInternalIp())

	MakeReport(results, "Check start")
}

func getInternalIp() string {
	var ips string
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		log.Fatal("Oops:" + err.Error())
	}
	for _, a := range addrs {
		if ipnet, ok := a.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
			if ipnet.IP.To4() != nil {
				ips = ips + ipnet.IP.String() + " ; "
			}
		}
	}
	return ips
}
func MakeReport(report []string, item string) {
	if len(report) == 0 {
		log.Fatal("没有信息报告")
	}
	fmt.Printf("\n/**********%s**********/\n", item)
	for _, ele := range report {
		fmt.Printf("%s\n", ele)
	}
	fmt.Printf("/**********Check finished**********/\n")

}
func main() {
	CheckInstall()
}
