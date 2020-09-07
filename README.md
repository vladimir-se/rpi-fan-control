# For Batocera Linux


# In the fan.sh file change CPU_PIN parameter to your.

Variable parameters:
fan_pin - PIN number;
min_temp - Temperature at which the cooler turns off;
max_temp - The temperature at which the cooler turns on.


```python
cp {custom.sh,fan.sh} /userdata/system/
chmod +x /userdata/system/{custom.sh,fan.sh}
reboot
```

