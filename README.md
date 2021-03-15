# Kali Security Sandbox

> My personal sandbox environment for testing out new
> security tools, vulnerable applications, and using in CTFs.
> Feel free to use this for your own studying or enjoyment!

## Usage

Set up the Vagrant box and bootstrap it with
my preferred directory structure and workspace environment.

```shell
# Start up the primary Kali machine
vagrant up
```

## Red Team Lab Environment (Optional)

This virtual environment comes with a few testing labs available. Pick your flavor!

### Juiceshop

```shell
# Start up juiceshop
vagrant up juiceshop

# Navigate to http://192.168.33.10
```

### Damn Vulnerable Web Application

```shell
# Start up DVWA
vagrant up dvwa

# Navigate to http://192.168.33.20
```

### Metasploitable

```shell
# Start up Metasploitable
vagrant up metasploitable

#  Navigate to http://192.168.33.30
```

## References

[OWASP Juiceshop](https://owasp.org/www-project-juice-shop/)

[OWASP Juiceshop CTF](https://github.com/bkimminich/juice-shop-ctf)

[DVWA](https://dvwa.co.uk/)

[Metasploitable](https://github.com/rapid7/metasploitable3)

[Metasploitable vulnerabilities](https://github.com/rapid7/metasploitable3/wiki/Vulnerabilities)
