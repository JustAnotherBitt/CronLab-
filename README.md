# 🐧 CronLab - Docker Crontab Vulnerability Lab

This is a lightweight and educational Docker lab designed to simulate a privilege escalation scenario through vulnerable `crontab` configuration. The goal is to escalate from a low-privileged user to `root` by abusing a misconfigured cronjob.

## 🔍 Purpose

The user `tester` has write access to a script executed by `root` every minute through `crontab`. By modifying the script, you may achieve command execution as `root`.

Your mission: get a root shell and capture the flag located at `/root/flag.txt`.


## 📁 Lab Structure

- `cronjob.sh` — Script scheduled to run every minute as root.
- `entrypoint.sh` — Starts necessary services (cron + ssh).
- `Dockerfile` — Builds the vulnerable Ubuntu 20.04 environment, sets up the user, cron, and the challenge.


## 🚀 How to Run the Lab

1. **Clone this repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/cronlab-docker.git
   cd cronlab-docker
   ```

2. **Build the Docker image**
   ```bash
   docker build -t cronlab .
   ```

3. **Start the container**
   ```bash
   docker run -it --rm -p 2222:22 cronlab
   ```

4. **Connect via SSH**
   ```bash
   ssh tester@localhost -p 2222
   ```

   > ⚠️ **Password is NOT provided.**
   >
   > You are encouraged to perform a **brute-force attack** using a wordlist such as `rockyou.txt` to discover the password.

5. **Explore & Exploit**
   - Modify `/opt/cronjob.sh` to run arbitrary commands.
   - Wait for the cronjob to execute and gain elevated privileges.


## 🏁 Flag

If exploited correctly, you will obtain a root shell and be able to read the flag at:

```
/root/flag.txt
```


## 📌 Notes

- This lab is for **educational purposes only**.
- Do not deploy in production environments.
- Brute-force attacks can be slow — be patient and learn the process.

## 💀 Stuck?

If you're stuck and can't solve the lab, feel free to contact me! I'll be happy to help. 💬

