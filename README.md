# Phonelab

Inspired by Google's [low-carbon computing platform from retired phones](https://research.google/blog/a-low-carbon-computing-platform-from-your-retired-phones/),
I wanted to see whether it's even possible to run Kubernetes on mobile phones.

All three phones run headless Linux, like small servers: no Android or iOS, no desktop,
just a console login on the screen and SSH.

I started with a Samsung Galaxy A11, installing Nura (postmarketOS), and ended up
running a mainline Linux 7.1 kernel on it, with my own device tree and drivers
for the phone.

The second device is a Google Pixel 7a. Its chip (Tensor G2) has no usable
mainline kernel support, so it runs Google's own Android kernel (6.1), rebuilt
with the features Kubernetes needs, with Alpine Linux on top instead of
Android.

The third device is an iPhone 6s running Nura on Linux 7.0 (it only boots while
tethered to my Mac via the checkm8 exploit). To get it working, I had to write
a PCIe host bridge driver for its A9 chip (for Wi-Fi and the internal NVMe
storage), patch the kernel's NVMe driver for Apple's storage controller, and add
touchscreen, battery and Wi-Fi support to its device tree.

<table>
  <tr>
    <td align="center"><img src="images/a11.jpg" alt="Galaxy A11 showing a Nura console login with an on-screen keyboard" width="260"></td>
    <td align="center"><img src="images/pixel.jpg" alt="Pixel 7a showing Alpine Linux boot messages and a login prompt with an on-screen keyboard" width="260"></td>
    <td align="center"><img src="images/iphone6s.jpg" alt="iPhone 6s showing Nura boot messages, a console login and the battery command's output, with an on-screen keyboard" width="260"></td>
  </tr>
  <tr>
    <td align="center">Galaxy A11: Nura, mainline Linux 7.1</td>
    <td align="center">Pixel 7a: Alpine Linux, Google's kernel 6.1</td>
    <td align="center">iPhone 6s: Nura, Linux 7.0</td>
  </tr>
</table>

All phones in one k0s cluster, on Wi-Fi, with the Pixel as the control plane:

![k9s node list: norris1z-galaxy-a11, norris1z-iphone-6s and norris1z-pixel-7a, all Ready](images/nodes.png)