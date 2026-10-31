# Phonelab

Inspired by Google's [low-carbon computing platform from retired phones](https://research.google/blog/a-low-carbon-computing-platform-from-your-retired-phones/),
I wanted to see whether it's even possible to run Kubernetes on mobile phones.

Both phones run headless Linux, like small servers: no Android, no desktop,
just a console login on the screen and SSH.

I started with a Samsung Galaxy A11, installing Nura (postmarketOS), and ended up
running a mainline Linux 7.1 kernel on it, with my own device tree and drivers
for the phone.

The second device is a Google Pixel 7a. Its chip (Tensor G2) has no usable
mainline kernel support, so it runs Google's own Android kernel (6.1), rebuilt
with the features Kubernetes needs, with Alpine Linux on top instead of
Android.

<table>
  <tr>
    <td align="center"><img src="images/a11.jpg" alt="Galaxy A11 showing a Nura console login with an on-screen keyboard" width="360"></td>
    <td align="center"><img src="images/pixel.jpg" alt="Pixel 7a showing Alpine Linux boot messages and a login prompt with an on-screen keyboard" width="360"></td>
  </tr>
  <tr>
    <td align="center">Galaxy A11: Nura, mainline Linux 7.1</td>
    <td align="center">Pixel 7a: Alpine Linux, Google's kernel 6.1</td>
  </tr>
</table>

Both phones in one k0s cluster, on Wi-Fi, with the Pixel as the control plane:

![kubectl get nodes: norris1z-galaxy-a11 and norris1z-pixel-7a, both Ready](images/nodes.png)

I'm experimenting with automating things with Ansible + Terraforms to automate 
the whole process, well, since I see myself adding more nodes.